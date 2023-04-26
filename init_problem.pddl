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
        (=(baseline)10)
        (=(dur)0)
        (= (extroversion_coefficient) 0.0)
        (= (desired_interaction) 10)
        (= (interaction_level) 10)  
        (computed_e)  
        (=(conscientious_coefficient)0.0)
        (=(desired_scrupulousness)10)
        (=(scrupulousness_level)10)
        (computed_c)  
        (=(agreeableness_coefficient)0.4)
        (=(desired_agreeableness)5)
        (=(agreeableness_level)3)
        (computed_a)    
)
(:goal  
    (and 
       (finished)
    )
)

)

