var BountyDapp = artifacts.require('./BountyDapp.sol')

module.exports = function (deployer) {
  deployer.deploy(BountyDapp)
}
