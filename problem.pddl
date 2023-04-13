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
        
)


(:goal  
    (and 
         (finished)
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
