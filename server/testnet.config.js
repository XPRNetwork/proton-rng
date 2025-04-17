const endpoints = [
  "https://testnet-api.alvosec.com",
  "https://tn1.protonnz.com",
  "https://proton-api-testnet.eosiomadrid.io"
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
          PRIVATE_PEM: '../testnet.private.pem',
          PUBLIC_PEM: '../testnet.public.pem'
        }
      }
    ]
};