(define (problem p) (:domain PROPER_navigation)
(:objects
	r1 - room
	r2 - room
)
(:init
      (extro)
      (intro)
      (consc)
      (unsc)
      (agree)
      (disagree)
      (at r1)
      (presented_task)
      (empty_robot)
      (finished)
      (production_room r2)
      (assembly_room r1)
      (human_present)
      (=(interaction_level)168.9999999999996)
      (=(scrupulousness_level)-189.0000000000004)
      (=(agreeableness_level)-73.99999999999993)
      (=(dur)5)
      (=(no_blocks)148.0)
      (=(max_no_blocks)3.0)
      (=(extroversion_coefficient)0.2)
      (=(desired_interaction)15.0)
      (=(conscientious_coefficient)0.2)
      (=(desired_scrupulousness)15.0)
      (=(agreeableness_coefficient)0.1)
      (=(desired_agreeableness)5.0)
      (=(baseline)10.0)
)
(:goal  
    (and 
       (finished)
    )
)

)


