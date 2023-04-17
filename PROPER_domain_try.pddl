(define (domain try_navigation)

(:requirements :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality :fluents :durative-actions  :duration-inequalities :continuous-effects :time :adl)

(:types
	room
)

(:functions
	(max_no_blocks)
	(no_blocks)
        (dur)
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
        (to_compute)
        (computed)
)

;extroversion actions
(:durative-action extro
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (<=(interaction_level)(desired_interaction)))
                     (at start (>(desired_interaction)0))
                )

        :effect
                (and    
                     (at end (increase (interaction_level) 5))
                )
)



;introvert actions
(:durative-action intro
        :duration
                (= ?duration 5)
        :condition
                (and
                     (at start (>(interaction_level)(desired_interaction)))
                     (at start (<(desired_interaction)0))
                )

        :effect
                (and    
                     (at end (decrease (interaction_level) 5))
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
                        (at start (computed))
                        (at start (at ?l1))
                        (at start (production_room ?l2))
                        (at start (>=(interaction_level)(desired_interaction)))

                )

        :effect
                (and    
                        (at end (not (at ?l1)))
                        (at end (at ?l2))
                        (at end (assign(dur)10))
                        (at end (not(computed)))
                        (at end (to_compute))
                )
)

(:durative-action reaching_assembly_room
        :parameters
                 (?l1 ?l2 - room)
        :duration
                (= ?duration 10)

        :condition
                (and
                        (at start (computed))
                        (at start (at ?l1))
                        (at start (assembly_room ?l2))
                        (at start (>=(interaction_level)(desired_interaction)))
                )

        :effect
                (and
                        (at end (to_compute))
                        (at end (assign(dur)10))
                        (at end (not(computed)))
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
                        (at start (computed))
                        (at start (at ?l1))
                        (at start (assembly_room ?l1))
                        (at start (>=(interaction_level)(desired_interaction)))
                )

        :effect
                (and
                        (at end (to_compute))
                        (at end (assign(dur)7))
                        (at end (not(computed)))
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
                        (at start (computed))
                        (at start (at ?l1))
                        (at start (production_room ?l1))
                        (at start (>=(interaction_level)(desired_interaction)))
                )

        :effect
                (and
                        (at end (to_compute))
                        (at end (assign(dur)7))
                        (at end (not(computed)))
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
                        (at start (computed))
                        (at start (at ?l1))
                        (at start(production_room ?l1))
                        (at start(presented_task ?l1))
                        (at start(human_present)) 
                        (at start(empty_robot)) 
                        (at start (>=(interaction_level)(desired_interaction)))
                )
        :effect
                (and
                        (at end (to_compute))
                        (at end (assign(dur)5))
                        (at end (not(computed)))
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
                        (at start (computed))
                        (at start (at ?l1))
                        (at start(assembly_room ?l1))
                        (at start(presented_task ?l1))
                        (at start(human_present)) 
                        (at start(block_to_deliver)) 
                        (at start (>=(interaction_level)(desired_interaction)))

                )
        :effect
                (and
                        (at end (empty_robot))
                        (at end (not(block_to_deliver)))
                        (at end (increase (no_blocks) 1))
                        (at end (to_compute))
                        (at end (not(computed)))
                        (at end (assign(dur)5))
                )
)

(:action compute_metric_sum
:precondition (and
        (>(desired_interaction)0)
        (to_compute)
)
:effect (and 
        (computed)
        (decrease (interaction_level)(*(extroversion_coefficient)(dur)))
        (not(to_compute))
)
)


(:action compute_metric_diff
:precondition (and
        (<(desired_interaction)0)
        (to_compute)
)
:effect (and 
        (computed)
        (increase (interaction_level)(*(extroversion_coefficient)(dur)))
        (not(to_compute))
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
