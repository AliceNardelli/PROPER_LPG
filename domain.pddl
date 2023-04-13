(define (domain PROPER_navigation_domain)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality :fluents)

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



(:action reaching_production_room
    :parameters (?l1 ?l2 - room)
    :precondition (and 
            (at ?l1)
            (production_room ?l2)
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
    )
)


(:action reaching_assembly_room
    :parameters (?l1 ?l2 - room)
    :precondition (and 
            (at ?l1)
            (assembly_room ?l2)
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
    )
)


(:action present_assembly_room
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (assembly_room ?l1)
    )
    :effect (and 
            (presented_task ?l1)
    )
)


(:action present_production_room
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (production_room ?l1)
    )
    :effect (and 
            (presented_task ?l1)
    )
)



(:action ask_pick_the_block
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (production_room ?l1)
            (presented_task ?l1)
            (human_present) 
            (empty_robot) 
    )
    :effect (and
    	    (not(empty_robot)) 
            (block_to_deliver) 
    )
)


(:action ask_assembly_block
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (assembly_room ?l1)
            (presented_task ?l1)
            (human_present) 
            (block_to_deliver) 
             
    )
    :effect (and
    	    (not(block_to_deliver)) 
            (empty_robot)
            (increase (no_blocks) 1)
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
