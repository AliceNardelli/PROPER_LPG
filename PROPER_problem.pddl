(define (problem p) (:domain PROPER_navigation_domain)
(:objects
	r1 - room
	r2 - room
)

(:init
        (assembly_room r1)
        (production_room r2)
        (at r1)
        (=(max_no_blocks)3)
        (=(no_blocks)0)
        (human_present) 
        (empty_robot)
        ; the desired level of interaction
        (=(level_of_interaction)4) 
        ;actual interaction
        (=(social_attention)6) 
        ;lower is this value higher is the number of time the robot try to interact  
        (=(inverse_extroversion_level)0.5)
)


(:goal  
    (and 
        (finished)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
