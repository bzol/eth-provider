const keythereum = require('keythereum');
const address = '0x88fE26353c95fb4fC2Cc96A17Ec4a51BcFA1D216';
const datadir = '../test-chain-dir';
const password = 'hellothere';
let str;
keythereum.importFromFile(address, datadir, function (keyObject) {
  keythereum.recover(password, keyObject, function (privateKey) {
    console.log(privateKey.toString('hex'));
		// 6c1c37bd23e89f55b6c983027ac84d5f26f2e0c71ca54a01340bcda1c6aef533
  });
});
