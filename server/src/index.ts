import { Api, JsonRpc, JsSignatureProvider } from '@protonprotocol/protonjs'
import fetch from 'node-fetch'
import { publicKey, sign } from './sign'
import { ENDPOINTS, PRIVATE_KEYS, CONTRACT, CONTRACT_PERMISSION } from './constants'

const rpc = new JsonRpc(ENDPOINTS, { fetch: fetch })
const api = new Api({ rpc, signatureProvider: new JsSignatureProvider(PRIVATE_KEYS as any) })

const wait = async (ms: number) => new Promise(resolve => setTimeout(resolve, ms))

const transact = async (actions: any) => {
  return await api.transact({
    actions
  }, {
    useLastIrreversible: true,
    expireSeconds: 400
  })
}

const process = async () => {
  const { rows } = await rpc.get_table_rows({
    code: CONTRACT,
    scope: CONTRACT,
    table: 'jobs.a',
    limit: -1
  })

  for (const row of rows) {
    try {
      const result = await transact([{
        account: CONTRACT,
        name: 'setrand',
        data: {
          job_id: row.id,
          random_value: sign(row.signing_value)
        },
        authorization: [{
          actor: CONTRACT,
          permission: CONTRACT_PERMISSION
        }]
      }])
      return result
    } catch (e) {
      const error = e.json ? e.json.error.details[0].message : e.toString()
      console.error(error)

      if (error.indexOf('assertion failure with message') !== -1) {
        await transact([{
          account: CONTRACT,
          name: 'killjobs',
          data: {
            job_ids: [row.id],
          },
          authorization: [{
            actor: CONTRACT,
            permission: CONTRACT_PERMISSION
          }]
        }])
      }
    }
  }
}

export const processAndWait = async () => {
  await process()
  await wait(2000)
  await processAndWait()
}

export const main = async () => {
  const { rows } = await rpc.get_table_rows({
    code: CONTRACT,
    scope: CONTRACT,
    table: 'sigpubkey.a',
    limit: 1
  })

  const exponent = '10001'
  const modulus = publicKey.export({ type: 'pkcs1', format: 'der' }).toString('hex').slice(18, -10)
  if (!rows.length || rows[0].exponent !== exponent || rows[0].modulus !== modulus) {
    await transact([{
      account: CONTRACT,
      name: 'setsigpubkey',
      data: {
        exponent,
        modulus
      },
      authorization: [{
        actor: CONTRACT,
        permission: CONTRACT_PERMISSION
      }]
    }])
  }

  await processAndWait()
}

main()