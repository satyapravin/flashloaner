const HDWalletProvider = require("@truffle/hdwallet-provider");
require('dotenv').config() 
const Web3 = require('web3');
const web3 = new Web3();

module.exports = {
  networks: {
    test: {
	provider: () => new HDWalletProvider('68e0b40525742bab791177d1c8fdd719141eeb62e6a50533af39168280e2ef3f', 'http://127.0.0.1:8545'),
	network_id: '*'
	},
    live: {
      provider: () => new HDWalletProvider('68e0b40525742bab791177d1c8fdd719141eeb62e6a50533af39168280e2ef3f', 'https://mainnet.infura.io/v3/90493710c2034aa2b8c6fabc26d47ec4'),
      network_id: '*',
      gas: 1499917,
      gasPrice: web3.utils.toWei('50', 'gwei')
    }
  },
  compilers: {
    solc: {
      version: '0.6.6',
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        }
      }
    },
  }
};
