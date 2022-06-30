/-  eth-provider
/+  ethereum, default-agent, dbug
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  [%0 @ud]
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
  `this
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
      %start-eth-action
    =/  tid  `@ta`(cat 3 'thread_' (scot %uv (sham eny.bowl)))
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

    =/  start-args  [~ `tid byk.bowl(r da+now.bowl) %eth-provider !>(get-balance)]
    =/  ta-now  `@ta`(scot %da now.bowl)
    :_  this
    :~
        [%pass /thread/[ta-now] %agent [our.bowl %spider] %watch /thread-result/[tid]]
        [%pass /thread/[ta-now] %agent [our.bowl %spider] %poke %spider-start !>(start-args)]
    ==
    :: [~ this]
  ==
  :: ++  handle-poke
  ::   |=  action=[%hello @p]
  ::   ^-  (quip card _state)
  ::   ?-    -.action
  ::       %hello
  ::     [~ this]

      :: ~&  +.action
      :: :_  %=  state  
      ::     mode  [%local +.action]
      ::     ==
      :: ~
      ::   %get-state
      :: [~ state]
    :: ==
  --
::
:: ++  on-poke  on-poke:def
++  on-watch  on-watch:def
++  on-leave  on-leave:def
++  on-peek   on-peek:def
++  on-agent  
   |=  [=wire =sign:agent:gall]
   ^-  (quip card _this)
   ?+    -.wire  (on-agent:def wire sign)
       %thread
     ?+    -.sign  (on-agent:def wire sign)
         %poke-ack
       ?~  p.sign
         %-  (slog leaf+"Thread started successfully" ~)
         `this
       %-  (slog leaf+"Thread failed to start" u.p.sign)
       `this
     ::
         %fact
       ?+    p.cage.sign  (on-agent:def wire sign)
           %thread-fail
         =/  err  !<  (pair term tang)  q.cage.sign
         %-  (slog leaf+"Thread failed: {(trip p.err)}" q.err)
         `this
           %thread-done
         :: =/  res  !<(ethout:eth-provider q.cage.sign)
         :: =/  res  !<(ethout:eth-provider q.cage.sign)
         =/  res  !<(ethout:eth-provider q.cage.sign)
         ~&  "eth-test thread-done!"
         ~&  res
         `this
       ==
     ==
   ==
++  on-arvo   on-arvo:def
++  on-fail   on-fail:def
--
::  helper core
|%
++  get-url  'url'
--
