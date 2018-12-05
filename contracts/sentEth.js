require('dotenv').config();
const fs = require("fs");
const Web3 = require('web3');
var Tx = require('ethereumjs-tx');
const ROPSTEN_ID=3;


const prov = process.env.INFURA_ROPSTEN_ENDPOINT;
const priv_key = process.env.PRIV_KEY;
const web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider(prov));

