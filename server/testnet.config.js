const endpoints = [
  "https://testnet-rpc.api.protondex.com",
  "https://testnet.proton.pink.gg"
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