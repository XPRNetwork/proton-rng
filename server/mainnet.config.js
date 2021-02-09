const endpoints = [
  "https://proton.eoscafeblock.com",
  "https://proton.eosusa.news",
  "https://proton.cryptolions.io",
  "https://proton.pink.gg"
]

module.exports = {
    apps : [
      {
        name: 'proton-rng-mainnet',
        script: 'dist/index.js',
        node_args : '-r dotenv/config',
        watch: false,
        env: {
          ENDPOINTS: endpoints.join(','),
          ACCOUNTS: accounts.join(','),
          PRIVATE_PEM: '../mainnet.private.pem',
          PUBLIC_PEM: '../mainnet.public.pem'
        }
      }
    ]
};