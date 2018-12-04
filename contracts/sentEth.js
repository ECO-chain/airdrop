require('dotenv').config();
const fs = require("fs");
const Web3 = require('web3');
var Tx = require('ethereumjs-tx');
const ROPSTEN_ID=3;


const prov = process.env.INFURA_ROPSTEN_ENDPOINT;
const priv_key = process.env.PRIV_KEY;
const web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider(prov));

const sendDataToContract = async (
    privateKey,
    gasPrice, 
    gasLimit,
    toAddr  
) => {
    const fromAddress = web3.eth.accounts.privateKeyToAccount(privateKey).address
    const privateKeyBuffer = Buffer.from(privateKey, 'hex')
    const transactionCount = await web3.eth.getTransactionCount(fromAddress)
    const gasPriceInput = gasPrice || await web3.eth.getGasPrice()
    //const addGweiGasPriceInput = parseInt(gasPriceInput, 10) + 3*10**9
    const gasLimitInput = gasLimit || 21000

    const rawTransaction = {
        "nonce": 4 , // Web3.utils.toHex(transactionCount),
        "gasPrice": Web3.utils.toHex(gasPriceInput),
        "gasLimit": Web3.utils.toHex(gasLimitInput),
        "to": toAddr,
        "value": web3.utils.toWei("0.001", "ether"),
        "chainId": ROPSTEN_ID
    }
    const tx = new Tx(rawTransaction)
    tx.sign(privateKeyBuffer)
    const receipt = await web3.eth.sendSignedTransaction('0x' + tx.serialize().toString('hex'))
        .on('receipt', res => res)
    return receipt
}
sendDataToContract(privateKey=priv_key,gasPrice=5,toAddr='0x87a0Fdf646B35fa89021410aC0c3D4272f1cB9c5').then(console.log)