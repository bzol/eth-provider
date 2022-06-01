/+  ethereum
=,  ethereum-types
|%
+$  url  @ta

+$  local
  $:  =url
  ==
+$  provider
  $:  =url
      kids=?  :: allow stars to receive requests from their planets
      clients=(list @p)
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

+$  action
  $%  [%set-local =local]
      [%set-provider =provider]
      [%set-client =client]

      :: [%get-balance =address]
      :: [%request-rpc]
      :: [%request-batch-rpc-strict]
      :: [%request-batch-rpc-loose]
      :: [%read-contract]
      :: [%batch-read-contract-strict reqs=(list proto-read-request:rpc:ethereum)]
      :: [%batch-read-contract-loose]
      :: [%read-loose]


      :: others to mirror?
  ==
:: +$  update
::   $%  [%get-state =mode]
::   ==

:: for starting a thread
+$  ethio
  $%  [%get-balance =address]

      :: [%get-balance =address]
      :: [%request-rpc]
      :: [%request-batch-rpc-strict]
      :: [%request-batch-rpc-loose]
      :: [%read-contract]
      :: [%batch-read-contract-strict reqs=(list proto-read-request:rpc:ethereum)]
      :: [%batch-read-contract-loose]
      :: [%read-loose]
  ==
--
