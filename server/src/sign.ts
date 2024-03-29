import crypto from 'crypto'
import fs from 'fs'
import path from 'path'
import { PRIVATE_PEM_PATH, PUBLIC_PEM_PATH } from './constants'

export const publicKey = crypto.createPublicKey({
    key: fs.readFileSync(path.resolve(__dirname, PUBLIC_PEM_PATH)),
    format: 'pem',
    type: 'pkcs1'
})

const privateKey = crypto.createPrivateKey({
    key: fs.readFileSync(path.resolve(__dirname, PRIVATE_PEM_PATH)),
    format: 'pem',
    type: 'pkcs1'
})

export const sign = (data: string) => {
  const sign = crypto.createSign('RSA-SHA256');
  sign.update(String(data));
  sign.end();
  return sign.sign(privateKey).toString('hex');
}