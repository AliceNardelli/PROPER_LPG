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
        (baseline)
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
        (extro)
        (intro)
        (computed_e)

)

(:action CHECK_EXTROVERSION
        :precondition
                (and
                  (>=(desired_interaction)(baseline)) 
                )

        :effect
                (and   
                     (extro)
                )
)

(:action CHECK_INTROVERSION
        :precondition
                (and
                  (<=(desired_interaction)(baseline)) 
                )

        :effect
                (and   
                     (intro)
                )
)

(:durative-action CHIT_CHAT
        :duration
                (= ?duration 5)
        :condition
                (and
                   (at start (<=(interaction_level)(desired_interaction)))
                   (at start (extro))
                )

        :effect
                (and    
                     (at end (increase (interaction_level)5))
                )
)

(:durative-action APPROACH_HUMAN
        :duration
                (= ?duration 5)
        :condition
                (and
                   (at start (<=(interaction_level)(desired_interaction)))
                   (at start (extro))
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
                   (at start (<=(interaction_level)(desired_interaction)))
                   (at start (extro))
                )

        :effect
                (and    
                     (at end (increase (interaction_level)5))
                )
)

(:durative-action GO_NOT_CROWDED_AREA
        :duration
                (= ?duration 5)
        :condition
                (and
                   (at start (>=(interaction_level)(desired_interaction)))
                   (at start (intro))
                )

        :effect
                (and    
                     (at end (decrease (interaction_level) 5))
                )
)

(:durative-action TURN_ON_BACK
        :duration
                (= ?duration 5)
        :condition
                (and
                   (at start (>=(interaction_level)(desired_interaction)))
                   (at start (intro))
                )

        :effect
                (and    
                     (at end (decrease (interaction_level) 5))
                )
)

(:durative-action REACHING_PRODUCTION_ROOM
        :parameters
                 (?l1 ?l2 - room)
        :duration
                (= ?duration 10)

        :condition
                (and
                        (at start (at ?l1))
                        (at start (production_room ?l2))
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                        (at start (computed_e))
                )

        :effect
                (and    
                        (at end (not (computed_e)))
                        (at end (not (at ?l1)))
                        (at end (at ?l2))
                )
)


(:durative-action REACHING_ASSEMBLY_ROOM
        :parameters
                 (?l1 ?l2 - room)
        :duration
                (= ?duration 10)

        :condition
                (and
                        (at start (computed_e))
                        (at start (at ?l1))
                        (at start (assembly_room ?l2))
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )

        :effect
                (and
                        (at end (not (at ?l1)))
                        (at end (at ?l2))
                        (at end (not (computed_e)))
                )
)

(:durative-action PRESENT_ASSEMBLY_ROOM
        :parameters
                 (?l1  - room)
        :duration
                (= ?duration 7)

        :condition
                (and
                        (at start (computed_e))
                        (at start (at ?l1))
                        (at start (assembly_room ?l1))
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )

        :effect
                (and
                        (at end (presented_task ?l1))
                        (at end (not (computed_e)))
                )
)



(:durative-action PRESENT_PRODUCTION_ROOM
        :parameters
                 (?l1  - room)
        :duration
                (= ?duration 7)

        :condition
                (and
                        (at start (computed_e))
                        (at start (at ?l1))
                        (at start (production_room ?l1))
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )

        :effect
                (and
                        (at end (presented_task ?l1))
                        (at end (not (computed_e)))
                )
)

(:durative-action ASK_PICK_THE_BLOCK
        :parameters
                 (?l1  - room)
        :duration
                (= ?duration 5)

        :condition
               (and 
                        (at start (computed_e))
                        (at start (at ?l1))
                        (at start(production_room ?l1))
                        (at start(presented_task ?l1))
                        (at start(human_present)) 
                        (at start(empty_robot)) 
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )
        :effect
                (and
                        (at end (not(empty_robot)))
                        (at end (block_to_deliver))
                        (at end (not (computed_e)))
                )
)


(:durative-action ASK_ASSEMBLY_BLOCK
        :parameters
                 (?l1  - room)
        :duration
                (= ?duration 5)

        :condition
               (and 
                        (at start (computed_e))
                        (at start (at ?l1))
                        (at start(assembly_room ?l1))
                        (at start(presented_task ?l1))
                        (at start(human_present)) 
                        (at start(block_to_deliver)) 
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )
        :effect
                (and
                        (at end (not (computed_e)))
                        (at end (empty_robot))
                        (at end (not(block_to_deliver)))
                        (at end (increase (no_blocks) 1))
                )
)



(:action COMPUTE_METRIC_MINUS
    :precondition (and 
         (not (computed_e))  
         (intro) 
    )
    :effect (and
    	   (computed_e)
           (increase (interaction_level)(*(extroversion_coefficient)5))
           )
)

(:action COMPUTE_METRIC_PLUS
    :precondition (and 
         (not (computed_e))  
         (extro) 
    )
    :effect (and
    	    (computed_e)
           (decrease (interaction_level)(*(extroversion_coefficient)5))
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
