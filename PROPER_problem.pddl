(define (problem p) (:domain PROPER_navigation)
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

        (= (extroversion_coefficient) -0.1)
        (= (desired_interaction) 5)
        (= (interaction_level) 7)
        (introvert)
)
(:goal  
    (and 
       (finished)
    )
)
;un-comment the following line if metric is needed
;(:metric minimize (???))
)
