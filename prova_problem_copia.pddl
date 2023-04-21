(define (problem p) (:domain PROPER_navigation)
(:objects
	r1 - room
	r2 - room
)
(:init
      (production_room r2)
      (assembly_room r1)
      (presented_task r1)
      (at r1)
      (human_present)
      (empty_robot)
      (extro)
      (consc)
      (computed_c)
      (disagree)
      (computed_a)
      (=(max_no_blocks)3.0)
      (=(no_blocks)0.0)
      (=(dur)7)
      (=(extroversion_coefficient)0.2)
      (=(desired_interaction)15.0)
      (=(interaction_level)15.0)
      (=(conscientious_coefficient)0.2)
      (=(desired_scrupulousness)15.0)
      (=(scrupulousness_level)13.6)
      (=(agreeableness_coefficient)0.1)
      (=(desired_agreeableness)5.0)
      (=(agreeableness_level)4.7)
      (=(baseline)10.0)
)
(:goal  
    (and 
       (finished)
    )
)

)


