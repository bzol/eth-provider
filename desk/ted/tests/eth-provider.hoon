/-  spider, ethdata=eth-provider, json-rpc
/+  strandio, ethereum, eth-provider
=,  strand=strand:spider
=,  dejs-soft:format
=,  strand-fail=strand-fail:libstrand:spider
=,  jael

^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
;<  =bowl:spider  bind:m  get-bowl:strandio
?>  =(src.bowl our.bowl)

=/  address  0x1d54.e0b2.8269.645e.75b1.1baa.9845.d8b0.c6ea.4147
:: Always use node/raw-transaction.js with new nonce to create a valid
:: transaction
=/  raw-tx  
0xf868.0286.0918.4e72.a000.8303.0000.94fa.3caa.bc8e.efec.2b5e.2895.e5af.bf79.379e.7268.a701.8082.0a95.a00b.0fe7.3820.9fa4.ae76.7792.d90e.f812.9e01.eeca.37d6.2ba0.9761.2b78.9e38.7473.f7a0.76ce.6971.77cb.5410.6c05.5d56.b06b.b864.b8bc.3eee.c249.332a.9186.4f14.0b81.b929 

:: =/  request-rpc  [%request-rpc [~ 'u_tid'] [%eth-block-number ~]]
=/  request-rpc  [%request-rpc [~ 'u_tid'] [%eth-send-raw-transaction raw-tx]]
=/  request-batch-rpc-strict  [%request-batch-rpc-strict ~[+.request-rpc]]
=/  request-batch-rpc-loose  [%request-batch-rpc-loose ~[+.request-rpc]]
=/  read-contract  [%read-contract [[~ 'unitid'] address ['func' ~[[%address address]]]]]
=/  batch-read-contract-strict  [%batch-read-contract-strict ~[+.read-contract]]
=/  get-latest-block  [%get-latest-block %.n]
=/  get-block-by-number  [%get-block-by-number 0]
=/  get-tx-by-hash  [%get-tx-by-hash 0x123]  :: bad hash
=/  get-logs-by-hash  [%get-logs-by-hash 0x123 [address ~] ~]
=/  get-logs-by-range  [%get-logs-by-range [address ~] ~ 0 1]
=/  get-next-nonce  [%get-next-nonce address]
=/  get-balance  [%get-balance address]

:: ;<  res=ethout:ethdata  bind:m  (eth-provider [%get-balance address])
;<  res=ethout:ethdata  bind:m  (eth-provider request-rpc)
:: =/  res2  !>(res)
:: =/  res2  +<.res



(pure:m !>(res))
