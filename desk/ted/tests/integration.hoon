/-  spider, ethdata=eth-provider, json-rpc
/+  strandio, ethereum, eth-provider
=,  strand=strand:spider
=,  dejs-soft:format
=,  strand-fail=strand-fail:libstrand:spider
=,  jael
=<
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m
=/  address  0x1d54.e0b2.8269.645e.75b1.1baa.9845.d8b0.c6ea.4147
=/  pk  0x50af.3cb5.6f61.9458.9e30.b645.4017.e4ca.7760.2459.2c1a.263e.c458.3bdd.3ece.69ce
:: You might need to create your own raw tx for testing in your
:: environment (see the node/raw-transaction.js and node/keythereum.js
:: files)
=/  raw-tx  
0xf868.0286.0918.4e72.a000.8303.0000.94fa.3caa.bc8e.efec.2b5e.2895.e5af.bf79.379e.7268.a701.8082.0a95.a00b.0fe7.3820.9fa4.ae76.7792.d90e.f812.9e01.eeca.37d6.2ba0.9761.2b78.9e38.7473.f7a0.76ce.6971.77cb.5410.6c05.5d56.b06b.b864.b8bc.3eee.c249.332a.9186.4f14.0b81.b929 

=/  get-timestamps  [%eth-get-timestamps !>(['http://localhost:8545' ~[0]])]
=/  get-tx-receipts  [%eth-get-tx-receipts !>(['http://localhost:8545' ~[0x123]])]
=/  send-txs  [%eth-send-txs !>(['http://localhost:8545' 0 ~[raw-tx]])]
:: =/  send-txs  [%eth-send-txs !>(['http://localhost:8545' 0 ~])]
=/  roller-send  [%roller-send !>(['http://localhost:8545' address 0 pk 0 0 0 ~[[0 [0 0] [[~zod %spawn] [%spawn ~zod address]]]]])]
=/  roller-nonce  [%roller-nonce !>(['http://localhost:8545' pk])]
=/  read-contract  [%eth-read-contract !>(['http://localhost:8545' [[~ 'unitid'] address ['func' ~[[%address address]]]]])]
=/  prep-command  [%claz-prep-command !>(['http://localhost:8545' [%generate /updates %mainnet address [%invites ~nut /~zod/base/197/out/txt]]])]  :: bad input
=/  prep-command2  [%claz-prep-command !>(['http://localhost:8545' [%generate /updates %mainnet address [%deed '{}']]])]
=/  eth-watcher  [%eth-watcher !>([~ [['http://localhost:8545' %.n ~h1 ~m1 0 [~ 0] ~[0x123] ~[0x123] ~[0x123]] 0 ~ ~[[[0x123 123] 0x123]]]])]

;<  t=vase  bind:m  (test-thread get-timestamps)
;<  t2=vase  bind:m  (test-thread get-tx-receipts)
:: ;<  t3=vase  bind:m  (test-thread send-txs)  ::  bad input
;<  t4=vase  bind:m  (test-thread roller-send)
;<  t5=vase  bind:m  (test-thread roller-nonce)
;<  t6=vase  bind:m  (test-thread read-contract)
;<  t7=vase  bind:m  (test-thread prep-command2)
;<  t8=vase  bind:m  (test-thread eth-watcher)

(pure:m !>(0))
::
|%
++  test-thread
|=  [thread-name=@t args=vase]
  =/  m  (strand ,vase)
  ;<  =bowl:spider  bind:m  get-bowl:strandio
  =/  tid  `@ta`(cat 3 'strand_' (scot %uv (sham thread-name eny.bowl)))
  ;<  ~             bind:m  (watch-our:strandio /awaiting/[tid] %spider /thread-result/[tid])
  ;<  ~             bind:m  %-  poke-our:strandio
                            :*  %spider
                                %spider-start
                                !>([`tid.bowl `tid byk.bowl(r da+now.bowl) thread-name args])
                            ==
  ;<  =cage         bind:m  (take-fact:strandio /awaiting/[tid])
  ;<  ~             bind:m  (take-kick:strandio /awaiting/[tid])
  ?+  p.cage  ~|([%strange-thread-result p.cage %child tid] !!)
  %thread-done  (pure:m q.cage)
  %thread-fail  (strand-fail !<([term tang] q.cage))
  ==
  :: ~&  q.cage
  :: ~&  '======================'
  :: (pure:m !>(q.cage))
--
