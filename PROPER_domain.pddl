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
(:durative-action chit_chat
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

(:durative-action approaching_human
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

(:durative-action express_enthusiasm
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
(:durative-action turn_on_back
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

(:durative-action reach_a_not_crowded_area
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
(:durative-action check_the_human_work
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

(:durative-action say_to_pay_attention
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
(:durative-action wait
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

(:durative-action go_in_a_random_position
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

(:durative-action say_no_matter_about_the_task
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
(:durative-action show_empathy
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

(:durative-action pleasure_humans
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

(:durative-action ask_to_help_the_human
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
(:durative-action say_the_human_it_work_better
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

(:durative-action try_replace_the_human
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

(:durative-action be_arrogant
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
(:durative-action reaching_production_room
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

(:durative-action reaching_assembly_room
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

(:durative-action present_assembly_room
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



(:durative-action present_production_room
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

(:durative-action ask_pick_the_block
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


(:durative-action ask_assembly_block
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

(:action check_finished
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
