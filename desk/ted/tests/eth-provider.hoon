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
=/  get-balance  [%get-next-nonce address]

:: ;<  res=ethout:ethdata  bind:m  (eth-provider [%get-balance address])
;<  res=ethout:ethdata  bind:m  (eth-provider [%get-balance address])

(pure:m !>(13))
