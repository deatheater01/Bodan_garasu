const fs = require('fs');
var defaultnode = "<default transaction node connection string>";
var Web3 = require("web3");
module.exports = {
  networks: {
    defaultnode: {
      provider: new Web3.providers.HttpProvider(defaultnode),
      network_id: "https://tarun01013h2747block.blockchain.azure.com:3200/PI9uI6d_jUcea13uQuPpzB6u"
    },
    tarun01013h2747conso: {
      network_id: "*",
      gas: 0,
      gasPrice: 0,
      provider: new HDWalletProvider(fs.readFileSync('/home/darwin0101/Desktop/fundManager/myblockchain.env', 'utf-8'), "https://tarun01013h2747block.blockchain.azure.com:3200/PI9uI6d_jUcea13uQuPpzB6u"),
      consortium_id: 1566233856113
    }
  }
};
