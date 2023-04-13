(define (domain PROPER_navigation_domain)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality :fluents)

(:types
	room
)

(:functions
	(max_no_blocks)
	(no_blocks)
	(level_of_interaction)
        (desire_capture_social_attention)
        (time)
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


(:action chit_chat
    :precondition (and 
            (>=(time)1)
    )
    :effect (and
    	    (increase (level_of_interaction) 2)
            (increase (time) 1)
    )
)

(:action express_enthusiasm
    :precondition (and 
            (>=(time)1)
    )
    :effect (and
    	  (increase (level_of_interaction) 2)
          (increase (time) 1)
    )
)

(:action approaching_human
    :precondition (and 
            (>=(time)1)
    )
    :effect (and
    	   (increase (level_of_interaction) 2)
           (increase (time) 1)
    )
)


(:action reaching_production_room
    :parameters (?l1 ?l2 - room)
    :precondition (and 
            (at ?l1)
            (production_room ?l2)
            (>(level_of_interaction)(desire_capture_social_attention))
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
            (decrease (level_of_interaction) 1)
            (increase (time) 1)
    )
)


(:action reaching_assembly_room
    :parameters (?l1 ?l2 - room)
    :precondition (and 
            (at ?l1)
            (assembly_room ?l2)
            (>(level_of_interaction)(desire_capture_social_attention))
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
            (decrease (level_of_interaction) 1)
            (increase (time) 1)
    )
)


(:action present_assembly_room
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (assembly_room ?l1)
            (>(level_of_interaction)(desire_capture_social_attention))
    )
    :effect (and 
            (presented_task ?l1)
            (decrease (level_of_interaction) 1)
            (increase (time) 1)
    )
)


(:action present_production_room
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (production_room ?l1)
            (>(level_of_interaction)(desire_capture_social_attention))
    )
    :effect (and 
            (presented_task ?l1)
            (decrease (level_of_interaction) 1)
            (increase (time) 1)
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
            (>(level_of_interaction)(desire_capture_social_attention))
    )
    :effect (and
    	    (not(empty_robot)) 
            (block_to_deliver) 
            (decrease (level_of_interaction) 1)
            (increase (time) 1)
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
            (>(level_of_interaction)(desire_capture_social_attention))

             
    )
    :effect (and
    	    (not(block_to_deliver)) 
            (empty_robot)
            (increase (no_blocks) 1)
            (decrease (level_of_interaction) 1)
            (increase (time) 1)
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
