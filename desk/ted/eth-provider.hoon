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
~&  'eth-provider called!'

=/  arg2  !<(ethio:eth-provider arg)
;<    state=state:eth-provider
    bind:m
  (scry:strandio state:eth-provider /gx/eth-provider/get-state/noun)
?-  active.state
  %local
(call-ethio arg2 url.local.state)
  %provider
(call-ethio arg2 url.provider.state)
  %client
;<  =bowl:spider  bind:m  get-bowl:strandio
;<  tid=tid:spider   bind:m  
  (start-thread-with-args:strandio [[~nut %base da+now.bowl] %eth-provider arg])
(pure:m !>(195))
==
::
|%
+$  provider-state
  $:  active=active:eth-provider
      local=local:eth-provider
      provider=provider:eth-provider
      client=client:eth-provider
  ==
++  call-ethio
  |=  [arg=ethio:eth-provider url=@ta]
  ~&  'call-ethio called!'
  =/  m  (strand ,vase)
  ?-  -.arg
    %get-balance
  =/  address  +.arg
  ;<  balance=@ud  bind:m  (get-balance:ethio url address)
  (pure:m !>(balance))
  ==
--
