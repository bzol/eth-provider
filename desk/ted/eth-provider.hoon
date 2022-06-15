/-  spider, eth-provider
/+  strandio, ethio, ethereum
=,  strand=strand:spider
=,  dejs-soft:format
=,  strand-fail=strand-fail:libstrand:spider
=<
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
::
=/  url  'http://localhost:8545'
~&  'thread called!'

=/  eth-input  !<(ethin:eth-provider arg)
;<  =bowl:spider  bind:m  get-bowl:strandio
:: =/  ship  !<(@p +<.arg)
:: =/  tid  !<(@ta +>.arg)

;<    state=state:eth-provider
    bind:m
  (scry:strandio state:eth-provider /gx/eth-provider/get-state/noun)
?-  active.state
  %local
(call-ethio eth-input active.state url.local.state)
  %provider
(call-ethio eth-input active.state url.provider.state)
  %client
~&  'client branch taken'
;<  ~  bind:m  (poke:strandio [provider.client.state %eth-provider] [%provider-action !>([%provide tid.bowl eth-input])])
~&  'client branch taken2'
;<  vmsg=vase   bind:m  (take-poke:strandio %noun)
~&  'vmsg console message'
~&  vmsg
~&  '===================='
(pure:m vmsg)
==
::
|%
+$  provider-state
  $:  active=active:eth-provider
      local=local:eth-provider
      provider=provider:eth-provider
      client=client:eth-provider
  ==
++  is-client
  |=  [tid=@tatid active=active:eth-provider eth-output=ethout:eth-provider]
  =/  m  (strand ,vase)
  :: (pure:m !>([tid eth-output]))
  ?-  active
    %local
  (pure:m !>(eth-output))
    %provider
  (pure:m !>([tid eth-output]))
    %client
  (pure:m !>(eth-output))
  ==
++  call-ethio
  |=  [arg=ethin:eth-provider active=active:eth-provider url=@ta]
  ~&  'call-ethio called!'
  =/  m  (strand ,vase)
  ;<  =bowl:spider  bind:m  get-bowl:strandio
  ?-  -.arg
    %request-rpc
  ;<  out=*  bind:m  (request-rpc:ethio url +.arg)
  (is-client tid.bowl active out)
    %request-batch-rpc-strict
  ;<  out=*  bind:m  (request-batch-rpc-strict:ethio url +.arg)
  (is-client tid.bowl active out)
    %request-batch-rpc-loose
  ;<  out=*  bind:m  (request-batch-rpc-loose:ethio url +.arg)
  (is-client tid.bowl active out)
    %read-contract
  ;<  out=*  bind:m  (read-contract:ethio url +.arg)
  (is-client tid.bowl active out)
    %batch-read-contract-strict
  ;<  out=*  bind:m  (batch-read-contract-strict:ethio url +.arg)
  (is-client tid.bowl active out)
    %get-latest-block
  ;<  out=*  bind:m  (get-latest-block:ethio url)
  (is-client tid.bowl active out)
    %get-block-by-number
  ;<  out=*  bind:m  (get-block-by-number:ethio url +.arg)
  (is-client tid.bowl active out)
    %get-tx-by-hash
  ;<  out=*  bind:m  (get-tx-by-hash:ethio url +.arg)
  (is-client tid.bowl active out)
    %get-logs-by-hash
  ;<  out=*  bind:m  (get-logs-by-hash:ethio url +.arg)
  (is-client tid.bowl active out)
    %get-logs-by-range
  ;<  out=*  bind:m  (get-logs-by-range:ethio url +.arg)
  (is-client tid.bowl active out)
    %get-next-nonce
  ;<  out=*  bind:m  (get-next-nonce:ethio url +.arg)
  (is-client tid.bowl active out)
    %get-balance
  ;<  out=*  bind:m  (get-balance:ethio url +.arg)
  (is-client tid.bowl active out)
  ==
--
