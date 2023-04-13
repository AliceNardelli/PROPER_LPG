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
        (extrovert)
        (=(excited)0)
        (=(verbally_interact)0)
        (=(human_approched)0)      
)


(:goal  
    (and 
        (finished)
        (captured_social_attention)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
