import crypto from 'crypto'
import fs from 'fs'
import path from 'path'
import { PRIVATE_PEM_PATH } from './constants'

const privateKey = crypto.createPrivateKey({
    key: fs.readFileSync(path.resolve(__dirname, PRIVATE_PEM_PATH)),
    format: 'pem',
    type: 'pkcs1'
})

export const sign = (data: string) => {
  const sign = crypto.createSign('RSA-SHA256');
  sign.update(data);
  sign.end();
  return sign.sign(privateKey).toString('hex');
}