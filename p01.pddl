
(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc{i}{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc{i}{j} and loc{h}{k}
  (:objects
    loc31 loc12 loc22 loc32 loc42 loc23 loc33 loc24 loc34 loc44 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc12)

    ; Locationg <> Corridor Connections
    
    ; row 1
    (connected-room loc31 c3132)
    
    ; row 2
    (connected-room loc12 c1222)
    
    (connected-room loc22 c1222)
    (connected-room loc22 c2223)
    (connected-room loc22 c2232)
    
    (connected-room loc32 c2232)
    (connected-room loc32 c3132)
    (connected-room loc32 c3242)
    (connected-room loc32 c3233)
    
    (connected-room loc42 c3242)
    
    ; row 3
    (connected-room loc23 c2223)
    (connected-room loc23 c2333)
    (connected-room loc23 c2324)
    
    (connected-room loc33 c3233)
    (connected-room loc33 c2333)
    (connected-room loc33 c3334)
    
    ; row 4
    (connected-room loc24 c2324)
    (connected-room loc24 c2434)
    
    (connected-room loc34 c3334)
    (connected-room loc34 c2434)
    (connected-room loc34 c3444)
    
    (connected-room loc44 c3444)

    ; Key locations
    (locate-key loc22 key1)
    (locate-key loc24 key2)
    (locate-key loc42 key3)
    (locate-key loc44 key4)

    ; Locked corridors
    (locked-cor c2324)
    (locked-col red c2324)
    (locked-cor c2434) 
    (locked-col red c2434)
    (locked-cor c3444) 
    (locked-col yellow c3444)
    (locked-cor c3242) 
    (locked-col purple c3242)
    (locked-cor c3132)
    (locked-col rainbow c3132)

    ; Risky corridors
    (risky c2324)
    (risky c2434) 
    
    ; Key colours
    (colour-key red key1)
    (colour-key yellow key2)
    (colour-key rainbow key3)
    (colour-key purple key4)

    ; Key usage properties (one use, two use, etc)
    (double-use key2)
    (single-use key3)
    (single-use key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc31)
    )
  )

)
