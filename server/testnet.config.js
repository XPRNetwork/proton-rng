const endpoints = [
  "https://testnet.protonchain.com",
  "https://testnet.proton.pink.gg"
]
const accounts = [
  'bot1@active',
  'bot2@active',
  'bot3@active' ,
  'bot4@active'
]

module.exports = {
    apps : [
      {
        name: 'proton-rng-testnet',
        script: 'dist/index.js',
        node_args : '-r dotenv/config',
        watch: false,
        env: {
          ENDPOINTS: endpoints.join(','),
          ACCOUNTS: accounts.join(','),
          PRIVATE_PEM: 'testnet.private.pem',
          PUBLIC_PEM: 'testnet.public.pem'
        }
      }
    ]
};