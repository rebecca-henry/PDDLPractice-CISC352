(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc{i}{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc{i}{j} and loc{h}{k}
  (:objects
    loc21 loc12 loc22 loc32 loc42 loc23 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc22)

    ; Locationg <> Corridor Connections
    ; row 1
    (connected-room loc21 c2122)
    
    ;row 2
    (connected-room loc12 c1222)
    
    (connected-room loc22 c2122)
    (connected-room loc22 c1222)
    (connected-room loc22 c2232)
    (connected-room loc22 c2223)
    
    (connected-room loc32 c2232)
    (connected-room loc32 c3242)
    
    (connected-room loc42 c3242)
    
    ; row 3
    (connected-room loc23 c2223)
    

    ; Key locations
    (locate-key loc22 key1) ; purple
    (locate-key loc12 key2) ; rainbow
    (locate-key loc21 key3) ; green
    (locate-key loc23 key4) ; yellow

    ; Locked corridors
    (locked-cor c1222)
    (locked-col yellow c1222)
    
    (locked-cor c2223)
    (locked-col green c2223)
    
    (locked-cor c2122)
    (locked-col purple c2122)
    
    (locked-cor c2232)
    (locked-col yellow c2232)
    
    (locked-cor c3242)
    (locked-col rainbow c3242)

    ; Risky corridors

    ; Key colours
    (colour-key purple key1)
    (colour-key rainbow key2)
    (colour-key green key3)
    (colour-key yellow key4)

    ; Key usage properties (one use, two use, etc)
    (double-use key4)
    (single-use key1)
    (single-use key3)
    (single-use key2)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc42)
    )
  )

)
