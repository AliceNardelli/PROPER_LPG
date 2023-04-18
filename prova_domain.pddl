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

(:durative-action EXTRO_ACTION
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

(:durative-action INTRO_ACTION
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
                )

        :effect
                (and    
                        (at end (not (at ?l1)))
                        (at end (at ?l2))
                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
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
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)10)))
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
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)7)))
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
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )

        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)7)))
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
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )
        :effect
                (and
                        (at end (increase (interaction_level)(*(extroversion_coefficient)5)))
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
                        (at start (or (and (<=(interaction_level)(desired_interaction)) (intro))(and (>=(interaction_level)(desired_interaction)) (extro))))
                )
        :effect
                (and
                        (at end (empty_robot))
                        (at end (not(block_to_deliver)))
                        (at end (increase (no_blocks) 1))
                        (at end (increase (interaction_level)(*(extroversion_coefficient)5)))
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
