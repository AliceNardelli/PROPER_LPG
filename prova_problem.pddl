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
        (= (extroversion_coefficient) 0.2)
        (= (desired_interaction) 15)
        (= (interaction_level) 17)  
        (computed_e)  
        (=(conscientious_coefficient)0.2)
        (=(desired_scrupulousness)15)
        (=(scrupulousness_level)17)
        (computed_c)  
        (=(agreeableness_coefficient)0.1)
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


