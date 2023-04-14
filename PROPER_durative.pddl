(define (domain PROPER_navigation_domain)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality :fluents :durative-actions :duration-inequalities :continuous-effects :time)

(:types
	room
)

(:functions
	(max_no_blocks)
	(no_blocks)   
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
                )

        :effect
                (and
                        (at end (not (at ?l1)))
                        (at end (at ?l2))
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
                )

        :effect
                (and
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
                        
                )

        :effect
                (and
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
                )

        :effect
                (and
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
                       
                )
        :effect
                (and
                        
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
                       
                )
        :effect
                (and
                        (at end (increase (no_blocks) 1))
                        (at end (empty_robot))
                        (at end (not(block_to_deliver)))
                        
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
