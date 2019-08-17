var SimpleBank = artifacts.require("./fundManager.sol");

module.exports = function(deployer) {
  deployer.deploy(SimpleBank, { value: 30000000000000000000 });
};
