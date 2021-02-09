const { loadConfig, Blockchain } = require("@klevoya/hydra");
const config = loadConfig("hydra.yml");
const fs = require('fs')
const path = require("path")
const { sha256 } = require('@proton/js')

const crypto = require('crypto');

const privateKey = crypto.createPrivateKey({
  key: fs.readFileSync(path.resolve(__dirname, 'private.pem')),
  format: 'pem',
  type: 'pkcs1'
})
const publicKey = crypto.createPublicKey({
  key: fs.readFileSync(path.resolve(__dirname, 'public.pem')),
  format: 'pem',
  type: 'pkcs1'
})

// const { privateKey, publicKey } = crypto.generateKeyPairSync('rsa', {
//   modulusLength: 2048,
// });
const sign = (data) => {
  const sign = crypto.createSign('RSA-SHA256');
  sign.update(data);
  sign.end();
  return sign.sign(privateKey).toString('hex');
}

const RNG = 'rng'
const RECEIVER = 'randreceiver'
const TABLES = {
  JOBS: 'jobs.a',
  SIGPUB: 'sigpubkey.a'
}

describe(RNG, () => {
  let blockchain = new Blockchain(config);
  let rng = blockchain.createAccount(RNG);
  let receiver = blockchain.createAccount(RECEIVER);

  beforeAll(async () => {
    receiver.setContract(blockchain.contractTemplates[RECEIVER]);

    rng.setContract(blockchain.contractTemplates[RNG]);
    rng.updateAuth(`active`, `owner`, { accounts: [{ permission: { actor: rng.accountName, permission: `eosio.code` }, weight: 1 }] });
  });

  beforeEach(async () => {
    rng.resetTables();
  });

  it("Workflow", async () => {
    expect.assertions(3);

    // Set signing key
    const pubKeyData = {
      exponent: '10001',
      modulus: publicKey.export({ type: 'pkcs1', format: 'der' }).toString('hex').slice(18, -10)
    }
    await rng.contract.setsigpubkey(pubKeyData)
    expect(rng.getTableRowsScoped(TABLES.SIGPUB)[RNG]).toEqual(
      [{
        id: "0",
        ...pubKeyData
      }]
    );

    // Create RNG request
    const request = {
      assoc_id: "3982992981388951552",
      signing_value: "13017239558691620510",
      caller: RECEIVER,
    }
    await rng.contract.requestrand(request, [{ actor: RECEIVER, permission: 'active', }]);
    expect(rng.getTableRowsScoped(TABLES.JOBS)[RNG]).toEqual(
      [{
        id: "0",
        ...request
      }]
    );

    // Fulfill RNG request
    const setData = {
      job_id: 0,
      random_value: sign(request.signing_value)
    }
    // console.log({
    //   job_id: 0,
    //   modulus: pubKeyData.modulus,
    //   random_value: setData.random_value
    // })
    const txTrace = await rng.contract.setrand(setData)
    const consoleOutput = txTrace.action_traces[1].console;
    expect(consoleOutput).toBe(`receiverand called: assoc_id=${request.assoc_id}, random_value=${sha256(setData.random_value)}\n`)
  });
});
