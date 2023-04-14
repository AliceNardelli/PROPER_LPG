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
                     (at end (increase (interaction_level)5))
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
                )

        :effect
                (and    
                        (at end (not (at ?l1)))
                        (at end (at ?l2))

                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
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
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
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
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
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
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
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
                )
        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
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
                )
        :effect
                (and
                        (at end (empty_robot))
                        (at end (not(block_to_deliver)))
                        (at end (increase (no_blocks) 1))

                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
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
