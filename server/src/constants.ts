if (!process.env.PRIVATE_PEM) {
    console.error('PRIVATE_PEM name must be provided in *.config.js')
    process.exit(0)
}
if (!process.env.PRIVATE_KEYS) {
    console.error('No PRIVATE_KEYS provided in .env')
    process.exit(0)
}
if (!process.env.ENDPOINTS) {
    console.error('No ENDPOINTS provided in *.config.js')
    process.exit(0)
}
export const PRIVATE_PEM_PATH = process.env.PRIVATE_PEM
export const PRIVATE_KEYS = process.env.PRIVATE_KEYS.split(',')
export const ENDPOINTS = process.env.ENDPOINTS.split(',')
export const CONTRACT = 'rng'
export const CONTRACT_PERMISSION = 'setrand'
