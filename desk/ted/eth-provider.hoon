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
  =/  arg2  +.arg
  ~&  arg2
  ;<  out=*  bind:m  (request-rpc:ethio url arg2)
  (is-client tid.bowl active out)

    %get-balance
  =/  address  +.arg
  ;<  balance=@ud  bind:m  (get-balance:ethio url address)
  (is-client tid.bowl active 123)
  ==
--
