
(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        (hero-at ?loc - location)

        ; IMPLEMENT ME
        (colour-key ?col - colour ?k - key) ; what colour col is the key k
        (locate-key ?loc - location ?k - key) ; which loc is the key k
        (single-use ?k - key) ; is the key k single use
        (double-use ?k - key) ; is the key k double use
        (used-up ?k - key) ; is the key k used up
        
        (locked-cor ?cor - corridor) ; is cor locked
        (locked-col ?col - colour ?cor - corridor) ; what col is the lock on cor
        (collapsed ?cor - corridor) ; is cor collapsed
        (connected-room ?loc - location ?cor - corridor) ; is loc connected to cor
        (risky ?cor - corridor) ;is the corrridor risky
        (to-be-collapsed ?cor - corridor) ; does cor need to be collapsed after passing?
        
        (holding-key ?k - key) ; which k is the hero holding
        (holding) ; is the hero holding a key
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - wants to move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky"
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and (hero-at ?from) 
                    (connected-room ?from ?cor) 
                    (connected-room ?to ?cor) 
                    (not (locked-cor ?cor)) 
                    (not (collapsed ?cor)) 
        ) 
        ; the hero is at from, from is connected to corridor cor 
        ; and to is connected to corridor cor, corridor cor is not locked 
        ; and corridor cor is not collapsed

        :effect (and
            (when 
                ; antecedant the cor is risky
                (to-be-collapsed ?cor) 
                ;consequent cor is collapsed and doesn't need to collapse
                (and (collapsed ?cor) (not (to-be-collapsed ?cor)) )
            )
            
            (hero-at ?to) ;update hero location
            (not (hero-at ?from))
        )
    )
    
    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and
            (hero-at ?loc)
            (locate-key ?loc ?k)
            (not (holding))
        )
        
        :effect (and
            (holding)
            (holding-key ?k)
            (hero-at ?loc) 
            (not(locate-key ?loc ?k)) ;the key has no location until dropped
        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and
            (holding) 
            (holding-key ?k) ; the hero is holding a key k
            (hero-at ?loc) ; the hero is at location loc
        )

        :effect (and
            (not (holding)) ; set hero to not holding key
            (not (holding-key ?k))
            (locate-key ?loc ?k) ; set location of key to the room
        )
    )

    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and
            (holding) 
            (holding-key ?k)
            (not (used-up ?k))
            (locked-cor ?cor) ;the corridor is locked-cor
            (locked-col ?col ?cor) 
            (colour-key ?col ?k) ;the key colour matches the lock colour
            (hero-at ?loc)
            (connected-room ?loc ?cor)
        )

        :effect (and
            ;remove a use if it was double or single use
            (when 
                ; antecedant when k is single use
                (single-use ?k) 
                ; consequent - set k to used up and no longer single use
                ( and (not (single-use ?k)) (used-up ?k))
            )
            (when 
                ; antecedant when k is double use
                (double-use ?k) 
                ; consequent set k to not double use, but single use
                ( and (not (double-use ?k)) (single-use ?k))
            )
            ;cor is not locked
            (not (locked-cor ?cor))
            ;if cor was risky is set to to-be-collapsed
            (when (risky ?cor)
                (to-be-collapsed ?cor) 
            )
        )
    )
)
