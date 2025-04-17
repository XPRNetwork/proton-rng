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
        log_date_format: 'YYYY-MM-DD HH:mm Z',
        node_args: '--max_old_space_size=4096',
        env: {
          ENDPOINTS: endpoints.join(','),
          PRIVATE_PEM: '../mainnet.private.pem',
          PUBLIC_PEM: '../mainnet.public.pem'
        }
      }
    ]
};