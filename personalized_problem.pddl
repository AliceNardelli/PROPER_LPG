(define (problem p) (:domain PROPER_personalized_navigation_domain)
(:objects
	pl - location
	hl - location
	wl - location
	r1 - location
	r2 - location 
	r3 - location
)

(:init
        (production_location pl)
        (human_location hl)
        (wait_location wl)
        (at wl)
        (random r1)
        (random r2)
        (random r3)
        (empty_robot)
        (new_block_available)
        (human_present)
        (disagreeable)
        (extrovert)
        (unscrupolous)
        (=(no_actions)0)
)


(:goal  
    (and 
         (at wl)
         (block_added)
         (>(no_actions)3)
         (<(no_actions)5)
    )
)

(:metric maximize (no_actions))

)
