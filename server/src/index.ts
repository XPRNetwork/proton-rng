import { Api, JsonRpc, JsSignatureProvider } from '@protonprotocol/protonjs'
import fetch from 'node-fetch'
import { sign } from './sign'
import { ENDPOINTS, PRIVATE_KEYS, CONTRACT, CONTRACT_PERMISSION } from './constants'

const rpc = new JsonRpc(ENDPOINTS, { fetch: fetch })
const api = new Api({ rpc, signatureProvider: new JsSignatureProvider(PRIVATE_KEYS as any) })

const wait = async (ms: number) => new Promise(resolve => setTimeout(resolve, ms))

const process = async () => {
  const { rows } = await rpc.get_table_rows({
    code: CONTRACT,
    scope: CONTRACT,
    table: 'jobs.a',
    limit: -1
  })

  for (const row of rows) {
    try {
      const result = await api.transact({
        actions: [{
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
        }]
      }, {
        useLastIrreversible: true,
        expireSeconds: 400
      })
      return result
    } catch (e) {
      console.error(e.json ? e.json.error.details[0].message : e.toString())
    }
  }
}

export const main = async () => {
  await process()
  await wait(5000)
}

main()