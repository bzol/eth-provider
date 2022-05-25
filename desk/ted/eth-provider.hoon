/-  spider, eth-provider
/+  *strandio, ethio, ethereum
=,  strand=strand:spider
=,  dejs-soft:format
=,  strand-fail=strand-fail:libstrand:spider
^-  thread:spider
|=  arg=vase
=/  m  (strand ,vase)
^-  form:m

=/  address  0x1d54.e0b2.8269.645e.75b1.1baa.9845.d8b0.c6ea.4147
=/  url  'http://localhost:8545'
:: =/  address  !<  (unit @ux)  arg

:: (get-balance:ethio url address)
:: =/  balance  (get-balance:ethio url address)
;<  test=*  bind:m  (get-balance:ethio url address)
~&  test
:: ~&  json

:: =*  bad-arg  (pure:m arg)

:: ~&  =(@ux -:!>(arg))
:: ?-  test
::   @ud
:: (pure:m arg)
::   @ux
:: (pure:m arg)
:: ==
(pure:m !>(0x13))























:: =/  cur  !<((unit @tas) arg)
:: ?~  cur  (strand-fail %no-arg ~)
:: =.  u.cur  (crip (cass (trip u.cur)))
:: ?.  ((sane %tas) u.cur)  (strand-fail %bad-currency-format ~)
:: ;<  =json  bind:m  (fetch-json (weld url (trip u.cur)))
:: =/  price=(unit @ta)  ((ot ~[bitcoin+(ot [u.cur no]~)]) json)
:: ?~  price  ((slog 'Currency not found.' ~) (pure:m !>(~)))
:: %-  (slog leaf+"{(trip u.price)} {(cuss (trip u.cur))}" ~)

:: 0x1d54.e0b2.8269.645e.75b1.1baa.9845.d8b0.c6ea.4147
