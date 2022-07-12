::  eth/read-contract: query ethereum for contract data
::
::    produces hex string result, for use with +decode-results:rpc:ethereum
::
/-  ethdata=eth-provider
/+  ethereum, ethio, strandio, eth-provider
=,  ethereum-types
=,  jael
::
|=  args=vase
=/  m  (strand:strandio ,vase)
=+  !<([url=@t read-request=proto-read-request:rpc:ethereum] args)
~&  '===read-contract==='

^-  form:m
;<  res2=ethout:ethdata  bind:m
  (eth-provider [%read-contract read-request])
?>  ?=(%read-contract -.res2)
~&  '===read-contract2==='
=/  res  +.res2

(pure:m !>(res))
