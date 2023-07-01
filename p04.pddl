(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc{i}{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc{i}{j} and loc{h}{k}
  (:objects
    loc11 loc12 loc13 loc21 loc22 loc31 loc32 loc42 loc43 - location
    c1112 c1121 c1213 c1222 c2122 c2131 c3132 c3243 c4243 - corridor
    k1 k2 k3 k4 k5 k6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc31)

    ; Locationg <> Corridor Connections
    ; row 1
    (connected-room loc11 c1121)
    (connected-room loc11 c1112)
    
    (connected-room loc21 c1121)
    (connected-room loc21 c2122)
    (connected-room loc21 c2131)
    
    (connected-room loc31 c2131)
    (connected-room loc31 c3132)
    
    ; row 2 
    (connected-room loc12 c1112)
    (connected-room loc12 c1213)
    (connected-room loc12 c1222)
    
    (connected-room loc22 c1222)
    (connected-room loc22 c2122)
    
    (connected-room loc32 c3132)
    (connected-room loc32 c3243)
    
    (connected-room loc42 c4243)
    
    ; row 3 
    (connected-room loc13 c1213)
    
    (connected-room loc43 c3243)
    (connected-room loc43 c4243)
    

    ; Key locations
    (locate-key loc31 k1) ;yellow
    (locate-key loc21 k2) ;red
    (locate-key loc12 k3) ;yellow
    (locate-key loc13 k4) ;green
    (locate-key loc13 k5) ;purple
    (locate-key loc32 k6) ;rainbow

    ; Locked corridors
    (locked-cor c2131)
    (locked-col yellow c2131)
    
    (locked-cor c2122)
    (locked-col red c2122)
    
    (locked-cor c1222)
    (locked-col yellow c1222)
    
    (locked-cor c1213)
    (locked-col yellow c1213)
    
    (locked-cor c1112)
    (locked-col green c1112)
    
    (locked-cor c1121)
    (locked-col yellow c1121)
    
    (locked-cor c3132)
    (locked-col purple c3132)
    
    (locked-cor c3243)
    (locked-col red c3243)
    
    (locked-cor c4243)
    (locked-col rainbow c4243)

    ; Risky corridors
    (risky c3243)
    (risky c2122)
    
    ; Key colours
    (colour-key yellow k1)
    (colour-key red k2)
    (colour-key yellow k3)
    (colour-key green k4)
    (colour-key purple k5)
    (colour-key rainbow k6)

    ; Key usage properties (one use, two use, etc)
    (double-use k1)
    (double-use k3)
    (single-use k4)
    (single-use k5)
    (single-use k6)

  )
  (:goal
    (and
      (hero-at loc42)
    )
  )

)
