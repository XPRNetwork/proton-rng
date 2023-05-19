const endpoints = [
  "https://mainnet-rpc.api.protondex.com",
  "https://proton.greymass.com",
  "https://proton.eoscafeblock.com"
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