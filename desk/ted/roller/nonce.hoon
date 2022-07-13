::  aggregator/nonce: get next nonce
::
/-  rpc=json-rpc, ethdata=eth-provider
/+  ethereum, ethio, strandio, eth-provider
::
|=  args=vase
=+  !<([endpoint=@t pk=@] args)
~&  '===roller-nonce==='
=/  m  (strand:strandio ,vase)
^-  form:m
::
=/  =address:ethereum
  (address-from-prv:key:ethereum pk)
;<  res=ethout:ethdata  bind:m
  (eth-provider [%get-next-nonce address])
?>  ?=(%get-next-nonce -.res)
=/  expected-nonce  +.res
~&  '===roller-nonce2==='
(pure:m !>(expected-nonce))
