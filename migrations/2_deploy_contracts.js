const ClimberFilmToken = artifacts.require("./ClimberFilmToken.sol");

module.exports = function(deployer) {
    deployer.deploy(ClimberFilmToken);
};