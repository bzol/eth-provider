/+  *test
|%
++  test-zero
  ;:  weld
  %+  expect-eq
    !>  0
    !>  (sub 0 0)
  %+  expect-eq
    !>  1
    !>  (sub 1 0)
  %+  expect-eq
    !>  0
    !>  (sub 20 20)
  %-  expect-fail
    |.  (sub 0 1)
  ==
++  test-one
  ;:  weld
  %+  expect-eq
    !>  0
    !>  (sub 1 1)
  %+  expect-eq
    !>  1
    !>  (sub 2 1)
  %+  expect-eq
    !>  19
    !>  (sub 20 1)
  %-  expect-fail
    |.  (sub 1 2)
  ==
++  test-half-open
  =|  run=@ud 
  =^  mov1  agent  
     (~(on-poke agent (bowl run)) %hark-action !>((add-note run)))
  =^  mova  agent
     (~(on-poke agent (bowl run)) %noun !>(%sane))
  =.  run  +(run)
  =^  mov2  agent  
     (~(on-poke agent (bowl run)) %hark-action !>(read-count))
  =^  mov3  agent
     (~(on-poke agent (bowl run)) %noun !>(%sane))
  =/  expected-archive=notification:hark
    [(add *time (mul ~s1 0)) bin ~[(body 0)]] 
  =+  !<(=state on-save:agent)
  =/  actual-archive=notification:hark
    (~(got re archive.state) (add *time ~s1) bin)
  (expect-eq !>(expected-archive) !>(actual-archive))
--
