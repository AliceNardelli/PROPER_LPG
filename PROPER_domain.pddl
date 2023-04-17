(define (domain PROPER_navigation)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality :fluents :durative-actions  :duration-inequalities :continuous-effects :time)

(:types
	room
)

(:functions
	(max_no_blocks)
	(no_blocks)

        (extroversion_coefficient)
        (desired_interaction)
        (interaction_level)

        (conscientious_coefficient)
        (desired_scrupulousness)
        (scrupulousness_level)     

        (agreeableness_coefficient)
        (desired_agreeableness)
        (agreeableness_level)  
)

(:predicates 
        (production_room ?r - room)
        (assembly_room ?r - room)
        (presented_task ?r - room)
        (at ?r - room)
        (human_present) 
        (block_to_deliver)
        (empty_robot)
        (finished)
        (introvert)
        (extrovert)
        (conscientous)
        (unscropolous)
        (agreeable)
        (disagreeable)

)

;extroversion actions
(:durative-action CHIT_CHAT
        :duration
                (= ?duration 5)
        :condition
                (and
                   (at start (<=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                   (at start (extrovert))
                )

        :effect
                (and    
                     (at end (increase (interaction_level)5))
                )
)

(:durative-action APPROACHING_HUMAN
        :duration
                (= ?duration 5)
        :condition
                (and
                        (at start (<=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                        (at start (extrovert))
                )

        :effect
                (and    
                     (at end (increase (interaction_level)5))
                )
)

(:durative-action EXPRESS_ENTHUSIASM
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                     (at start (extrovert))
                )

        :effect
                (and    
                     (at end (increase (interaction_level)5))
                )
)

;introvert actions
(:durative-action TURN_ON_BACK
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                     (at start (introvert))
                )

        :effect
                (and    
                     (at end (increase (interaction_level)5))
                )
)

(:durative-action REACH_A_NOT_CROWDED_AREA
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                     (at start (introvert))
                )

        :effect
                (and    
                     (at end (increase (interaction_level) 5))
                )
)
;conscientous action
(:durative-action CHECK_THE_HUMAN_WORK
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                     (at start (conscientous))
                )

        :effect
                (and    
                     (at end (increase (scrupulousness_level) 5))
                )
)

(:durative-action SAY_TO_PAY_ATTENTION
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                     (at start (conscientous))
                )

        :effect
                (and    
                     (at end (increase (scrupulousness_level) 5))
                )
)

;unscr ac
(:durative-action WAIT
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                     (at start (unscropolous))
                )

        :effect
                (and    
                     (at end (increase (scrupulousness_level) 5))
                )
)

(:durative-action GO_RANDOM
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                     (at start (unscropolous))
                )

        :effect
                (and    
                     (at end (increase (scrupulousness_level) 5))
                )
)

(:durative-action SAY_CONFUSING
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                     (at start (unscropolous))
                )

        :effect
                (and    
                     (at end (increase (scrupulousness_level) 5))
                )
)


;agreeableness action
(:durative-action SHOW_EMPATHY
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                     (at start (agreeable))
                )

        :effect
                (and    
                     (at end (increase (agreeableness_level) 5))
                )
)

(:durative-action PLEASURE_HUMANS
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                     (at start (agreeable))
                )

        :effect
                (and    
                     (at end (increase (agreeableness_level) 5))
                )
)

(:durative-action ASK_IF_NEED_HELP
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                     (at start (agreeable))
                )

        :effect
                (and    
                     (at end (increase (agreeableness_level) 5))
                )
)


;disagreeable action
(:durative-action SAY_ROBOT_WORK_BETTER
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                     (at start (disagreeable))
                )

        :effect
                (and    
                     (at end (increase (agreeableness_level) 5))
                )
)

(:durative-action TRY_REPLACE_THE_HUMAN
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                     (at start (disagreeable))
                )

        :effect
                (and    
                     (at end (increase (agreeableness_level) 5))
                )
)

(:durative-action BE_ARROGANT
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                     (at start (disagreeable))
                )

        :effect
                (and    
                     (at end (increase (agreeableness_level) 5))
                )
)


;standard plan actions
(:durative-action REACHING_PRODUCTION_ROOM
        :parameters
                 (?l1 ?l2 - room)
        :duration
                (= ?duration 10)

        :condition
                (and
                        (at start (at ?l1))
                        (at start (production_room ?l2))
                        (at start (>=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                        (at start (>=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                        (at start (>=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                )

        :effect
                (and    
                        (at end (not (at ?l1)))
                        (at end (at ?l2))

                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
                        (at end (increase (scrupulousness_level)(*(conscientious_coefficient)10)))
                        (at end (increase (agreeableness_level)(*(agreeableness_coefficient)10)))
                )
)

(:durative-action REACHING_ASSEMBLY_ROOM
        :parameters
                 (?l1 ?l2 - room)
        :duration
                (= ?duration 10)

        :condition
                (and
                        (at start (at ?l1))
                        (at start (assembly_room ?l2))
                        (at start (>=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                        (at start (>=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                        (at start (>=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
                        (at end (increase (scrupulousness_level)(*(conscientious_coefficient)10)))
                        (at end (increase (agreeableness_level)(*(agreeableness_coefficient)10)))
                        (at end (not (at ?l1)))
                        (at end (at ?l2))
                )
)

(:durative-action PRESENT_ASSEMBLY_ROOM
        :parameters
                 (?l1  - room)
        :duration
                (= ?duration 7)

        :condition
                (and
                        (at start (at ?l1))
                        (at start (assembly_room ?l1))
                        (at start (>=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                        (at start (>=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                        (at start (>=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)7)))
                        (at end (increase (scrupulousness_level)(*(conscientious_coefficient)7)))
                        (at end (increase (agreeableness_level)(*(agreeableness_coefficient)7)))
                        (at end (presented_task ?l1))
                )
)



(:durative-action PRESENT_PRODUCTION_ROOM
        :parameters
                 (?l1  - room)
        :duration
                (= ?duration 7)

        :condition
                (and
                        (at start (at ?l1))
                        (at start (production_room ?l1))
                        (at start (>=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                        (at start (>=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                        (at start (>=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)7)))
                        (at end (increase (scrupulousness_level)(*(conscientious_coefficient)7)))
                        (at end (increase (agreeableness_level)(*(agreeableness_coefficient)7)))
                        (at end (presented_task ?l1))
                )
)

(:durative-action ASK_PICK_THE_BLOCK
        :parameters
                 (?l1  - room)
        :duration
                (= ?duration 5)

        :condition
               (and 
                        (at start (at ?l1))
                        (at start(production_room ?l1))
                        (at start(presented_task ?l1))
                        (at start(human_present)) 
                        (at start(empty_robot)) 
                        (at start (>=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                        (at start (>=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                        (at start (>=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                )
        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)5)))
                        (at end (increase (scrupulousness_level)(*(conscientious_coefficient)5)))
                        (at end (increase (agreeableness_level)(*(agreeableness_coefficient)5)))
                        (at end (not(empty_robot)))
                        (at end (block_to_deliver))
                )
)


(:durative-action ASK_ASSEMBLY_BLOCK
        :parameters
                 (?l1  - room)
        :duration
                (= ?duration 5)

        :condition
               (and 
                        (at start (at ?l1))
                        (at start(assembly_room ?l1))
                        (at start(presented_task ?l1))
                        (at start(human_present)) 
                        (at start(block_to_deliver)) 
                        
                        (at start (>=(*(interaction_level)(interaction_level))(*(desired_interaction)(desired_interaction))))
                        (at start (>=(*(scrupulousness_level)(scrupulousness_level))(*(desired_scrupulousness)(desired_scrupulousness))))
                        (at start (>=(*(agreeableness_level)(agreeableness_level))(*(desired_agreeableness)(desired_agreeableness))))
                )
        :effect
                (and
                        (at end (empty_robot))
                        (at end (not(block_to_deliver)))
                        (at end (increase (no_blocks) 1))
                        (at end (increase (interaction_level)(*(extroversion_coefficient)5)))
                        (at end (increase (scrupulousness_level)(*(conscientious_coefficient)5)))
                        (at end (increase (agreeableness_level)(*(agreeableness_coefficient)5)))
                )
)

(:action CHECK_FINISHED
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (assembly_room ?l1)
            (>(no_blocks)(max_no_blocks))
    )
    :effect (and
    	    (finished)
    )
)
)
