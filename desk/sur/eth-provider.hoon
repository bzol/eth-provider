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

+$  mode
  $%  [%local =local]
      [%provider =provider]
      [%client =client]
  ==

+$  action
  $%  [%set-local =local]
      :: [%set-provider =provider]
      :: [%set-client =client]
      :: [%get-state =mode]

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

+$  update
  $%  [%get-state =mode]
  ==
--
