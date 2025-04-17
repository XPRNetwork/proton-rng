const endpoints = [
  "https://api.protonnz.com",
  "https://proton.eosusa.io",
  "https://proton.protonuk.io"
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
          PRIVATE_PEM: '../mainnet.private.pem',
          PUBLIC_PEM: '../mainnet.public.pem'
        }
      }
    ]
};