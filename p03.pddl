(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc{i}{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc{i}{j} and loc{h}{k}
  (:objects
    loc34 loc45 loc12 loc22 loc32 loc33 loc25 loc13 loc21 loc14 loc35 loc24 loc44 loc23 loc43 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 
    c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc21)
    ; Locationg <> Corridor Connections
    ; row 1
    (connected-room loc21 c2122)
    
    ;row 2
    (connected-room loc12 c1213)
    (connected-room loc12 c1222)
    (connected-room loc12 c1223)
    
    (connected-room loc22 c1222)
    (connected-room loc22 c2122)
    (connected-room loc22 c2232)
    (connected-room loc22 c2223)
    
    (connected-room loc32 c2232)
    (connected-room loc32 c3223)
    (connected-room loc32 c3233)
    
    ; row 3
    (connected-room loc13 c1213)
    (connected-room loc13 c1323)
    (connected-room loc13 c1314)
    
    (connected-room loc23 c1223)
    (connected-room loc23 c2223)
    (connected-room loc23 c3223)
    (connected-room loc23 c1323)
    (connected-room loc23 c2333)
    (connected-room loc23 c2314)
    (connected-room loc23 c2324)
    (connected-room loc23 c2334)
    
    (connected-room loc33 c3233)
    (connected-room loc33 c2333)
    (connected-room loc33 c3334)
    
    (connected-room loc43 c4443)
    
    ;row 4 
    (connected-room loc14 c1314)
    (connected-room loc14 c2314)
    (connected-room loc14 c1424)
    
    (connected-room loc24 c1424)
    (connected-room loc24 c2324)
    (connected-room loc24 c2425)
    (connected-room loc24 c2434)
    
    (connected-room loc34 c2434)
    (connected-room loc34 c2334)
    (connected-room loc34 c3334)
    
    (connected-room loc44 c4443)
    (connected-room loc44 c4544)
    
    ; row 5
    (connected-room loc25 c2425)
    (connected-room loc25 c2535)
    
    (connected-room loc35 c2535)
    (connected-room loc35 c3545)
    
    (connected-room loc45 c3545)
    (connected-room loc45 c4544)
    
    ; Key locations
    (locate-key loc21 key1) ;red
    (locate-key loc23 key2) ;green
    (locate-key loc23 key3) ;purple
    (locate-key loc23 key4) ;green
    (locate-key loc23 key5) ;purple
    (locate-key loc44 key6) ;rainbow

    ; Locked corridors
    (locked-cor c2223)
    (locked-col red c2223)
    
    (locked-cor c1223)
    (locked-col red c1223)
    
    (locked-cor c3223)
    (locked-col red c3223)
    
    (locked-cor c1323)
    (locked-col red c1323)
    
    (locked-cor c2333)
    (locked-col red c2333)
    
    (locked-cor c2314)
    (locked-col red c2314)
    
    (locked-cor c2324)
    (locked-col red c2324)
    
    (locked-cor c2334)
    (locked-col red c2334)
    
    (locked-cor c2425)
    (locked-col purple c2425)
    
    (locked-cor c2535)
    (locked-col green c2535)
    
    (locked-cor c3545)
    (locked-col purple c3545)
    
    (locked-cor c4544)
    (locked-col green c4544)
    
    (locked-cor c4443)
    (locked-col rainbow c4443)

    ; Risky corridors
    (risky c2223)
    (risky c1223)
    (risky c3223)
    (risky c1323)
    (risky c2333)
    (risky c2314)
    (risky c2324)
    (risky c2334)

    ; Key colours
    (colour-key red key1)
    (colour-key green key2)
    (colour-key purple key3)
    (colour-key green key4)
    (colour-key purple key5)
    (colour-key rainbow key6)

    ; Key usage properties (one use, two use, etc)
    (single-use key5)
    (single-use key3)
    (single-use key4)
    (single-use key2)
    (single-use key6)
  )
  (:goal
    (and
      (hero-at loc43)
    )
  )

)
