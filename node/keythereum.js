const keythereum = require('keythereum');
// const address = '0x0829ced857806e0fd28df2426d4637bbbad170f3';
// const datadir = '../test-chain-dir';
// const password = 'password';

// var dk = keythereum.create();
// console.log(Buffer.dk);
// keythereum.dump(password, dk.privateKey, dk.salt, dk.iv);

// let str;
// keythereum.importFromFile(address, datadir, function (keyObject) {
//   keythereum.recover(password, keyObject, function (privateKey) {
//     console.log(privateKey.toString('hex'));
// 		// 6c1c37bd23e89f55b6c983027ac84d5f26f2e0c71ca54a01340bcda1c6aef533
//   });
// });

var password = "password";
var params = { keyBytes: 32, ivBytes: 16 };

var dk = keythereum.create(params);
console.log(dk.privateKey);
var keyObject = keythereum.dump(password, dk.privateKey, dk.salt, dk.iv);
keythereum.exportToFile(keyObject);
