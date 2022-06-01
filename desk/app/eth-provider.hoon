/-  eth-provider
/+  ethereum, default-agent, dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  
  $:  %0
      active=active:eth-provider
      local=local:eth-provider
      provider=provider:eth-provider
      client=client:eth-provider
  ==
+$  card  card:agent:gall
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
=<
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %.n) bowl)
::
++  on-init
  ^-  (quip card _this)
  =/  init-state  [%0 %local 'http://localhost:8545' ['http://localhost:8545' %.n ~] ~zod]
  :-  ~
  this(state init-state)
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  old-state=vase
  ^-  (quip card _this)
  =/  old  !<(versioned-state old-state)
  ?-  -.old
    %0  `this(state old)
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  |^
  ?>  =(src.bowl our.bowl)
  ?+    mark  (on-poke:def mark vase)
      %provider-action
    =^  cards  state
      (handle-poke !<(action:eth-provider vase))
    [cards this]
  ==
  ++  handle-poke
    |=  =action:eth-provider
    ^-  (quip card _state)
    ?-    -.action
        %set-local
      ~&  +.action
      :_  %=  state
          active  %local
          local  +.action
          ==
      ~
        %set-provider
      ~&  +.action
      :_  %=  state
          active  %provider
          provider  +.action
          ==
      ~
        %set-client
      ~&  +.action
      :_  %=  state
          active  %client
          client  +.action
          ==
      ~
    ==
  --
::
:: ++  on-poke  on-poke:def
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   
  |=  =path
  ~&  'on-peek called!'
  ^-  (unit (unit cage))
  ?+    path  (on-peek:def path)
      [%x %get-state ~]  
    ~&  +.state
    ``noun+!>(+.state)
  ==
++  on-agent  on-agent:def
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
::  helper core
|%
++  get-url  'url'
--
