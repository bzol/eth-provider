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

=/  address  0x829.ced8.5780.6e0f.d28d.f242.6d46.37bb.bad1.70f3
=/  raw-tx  
0xf868.8086.0918.4e72.a000.8303.0000.94fa.3caa.bc8e.efec.2b5e.2895.e5af.bf79.379e.7268.a701.8082.0a95.a01b.454a.f567.4416.0fed.c195.0282.8de3.e3c6.a14e.b927.66ec.f494.bd22.ce11.9641.d3a0.44c2.d606.55b1.b052.bd00.d354.d1c2.b1c6.bc2c.52fa.b7ff.556f.c879.e5f7.0114.26de  

:: =/  request-rpc  [%request-rpc [~ 'u_tid'] [%eth-block-number ~]]
=/  request-rpc  [%request-rpc [~ 'u_tid'] [%eth-send-raw-transaction raw-tx]]
:: =/  request-batch-rpc-strict  ~[+.request-rpc]
=/  request-batch-rpc-loose  [%request-batch-rpc-loose ~[+.request-rpc]]
=/  read-contract  [%read-contract [[~ 'unitid'] address ['func' ~[[%address address]]]]]
=/  batch-read-contract-strict  [%batch-read-contract-strict ~[+.read-contract]]
=/  get-latest-block  %.n
=/  get-block-by-number  [%get-block-by-number 0]
=/  get-tx-by-hash  [%get-tx-by-hash 0x123]  :: bad hash
=/  get-logs-by-hash  [%get-logs-by-hash 0x123 [address ~] ~]
=/  get-logs-by-range  [%get-logs-by-range [address ~] ~ 0 1]
=/  get-next-nonce  [%get-next-nonce address]
=/  get-balance  [%get-balance address]

:: ;<  res=ethout:ethdata  bind:m  (eth-provider [%get-balance address])
;<  res=block  bind:m  (get-latest-block:eth-provider get-latest-block)


:: =/  res2  !>(res)
:: =/  res2  +<.res



(pure:m !>(res))
