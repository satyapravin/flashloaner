const Migrations = artifacts.require("DyDxFlashLoaner.sol");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
