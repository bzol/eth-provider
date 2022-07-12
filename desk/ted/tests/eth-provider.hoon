/-  spider, ethdata=eth-provider, json-rpc
/+  strandio, ethio, ethereum, eth-provider
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

=/  request-rpc  [%request-rpc [~ 'u_tid'] [%eth-block-number ~]]
=/  request-batch-rpc-strict  [%request-batch-rpc-strict ~[+.request-rpc]]
=/  request-batch-rpc-loose  [%request-batch-rpc-loose ~[+.request-rpc]]
=/  read-contract  [%read-contract [[~ 'unitid'] address ['func' ~[[%address address]]]]]
=/  batch-read-contract-strict  [%batch-read-contract-strict ~[+.read-contract]]
=/  get-latest-block  [%get-latest-block %.n]
=/  get-block-by-number  [%get-block-by-number 0]
=/  get-tx-by-hash  [%get-tx-by-hash address]  :: retest
=/  get-logs-by-hash  [%get-logs-by-hash 0x123 [address ~] ~]
=/  get-logs-by-range  [%get-logs-by-range [address ~] ~ 0 1]
=/  get-next-nonce  [%get-next-nonce address]
=/  get-balance  [%get-balance address]

:: ;<  res=ethout:ethdata  bind:m  (eth-provider [%get-balance address])
;<  res=ethout:ethdata  bind:m  (eth-provider batch-read-contract-strict)

(pure:m !>(res))
