/-  json-rpc
/+  ethereum
=,  ethereum-types
=,  jael
|%
+$  url  @ta

+$  local
  $:  =url
  ==
+$  provider
  $:  =url
      kids=?  :: allow stars to receive requests from their planets
      clients=(set @p)
  ==
+$  client
  $:  provider=@p
  ==
+$  active  ?(%local %provider %client)

+$  state
  $:  =active
      =local
      =provider
      =client
  ==
+$  topics  (list ?(@ux (list @ux)))

+$  action
  $%  [%set-local =local]
      [%set-provider =provider]
      [%set-client =client]
      [%provide tid=@ta =ethin]
      [%set-kids kids=?]
      [%add-client client=@p]
      [%remove-client client=@p]
  ==
:: +$  update
::   $%  [%get-state =mode]
::   ==

:: for starting a thread
+$  ethin
  $%  
      [%request-rpc id=(unit @t) req=request:rpc:ethereum]
      [%request-batch-rpc-strict reqs=(list [id=(unit @t) req=request:rpc:ethereum])]
      [%request-batch-rpc-loose reqs=(list [id=(unit @t) req=request:rpc:ethereum])]
      [%read-contract req=proto-read-request:rpc:ethereum]
      [%batch-read-contract-strict reqs=(list proto-read-request:rpc:ethereum)]
      [%get-latest-block foo=?]
      [%get-block-by-number =number:block]
      [%get-tx-by-hash tx-hash=@ux]
      [%get-logs-by-hash =hash:block contracts=(list address) =topics]
      [%get-logs-by-range contracts=(list address) =topics =from=number:block =to=number:block]
      [%get-next-nonce =address]
      [%get-balance =address]
  ==
+$  ethout
  :: $%
  $?  
      :: [noun=*]
      :: [res=json:json-rpc]
      [res=(list json:json-rpc)]
      [number=@ud]
      [string=@t]
      :: [res=json:json-rpc]
      :: [res=@tas]
      :: []
  ==
--
