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

=/  arg2  !<(ethio:eth-provider arg)
;<    mode=mode:eth-provider  
    bind:m
  (scry:strandio mode:eth-provider /gx/eth-provider/get-mode/noun)
~&  mode
?-  -.mode
  %local
(call-ethio arg2 url)
  %provider
(call-ethio arg2 url)
  %client
:: start an eth-provider thread at the provider ship
(pure:m !>(0x13))
==

::
|%
++  call-ethio
  |=  [arg=ethio:eth-provider url=@ta]
  =/  m  (strand ,vase)
  ?-  -.arg
    %get-balance
  =/  address  +.arg
  ;<  test=*  bind:m  (get-balance:ethio url address)
  (pure:m !>(0x13))
  ==
--
