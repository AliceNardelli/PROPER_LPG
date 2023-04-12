(define (domain PROPER_personalized_navigation_domain)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality :action-costs :fluents :probabilistic-effects)

(:types
	location
)

(:functions
 (no_actions)
)

(:predicates 
        (production_location ?l - location)
        (human_location ?l - location)
        (wait_location ?l - location)
        (random ?l - location)
        (new_block_available)
        (at ?l - location)
        (empty_robot)
        (block_to_deliver)
        (human_present)
        (block_added)
        (extrovert) 
        (introvert)
        (coscientous)
        (unscrupolous)
        (agreeable)
        (disagreeable)
        (avoid_social_attention)
        (capture_social_attention)
        (move_randomly)
        (self_centered)
)

(:derived (avoid_social_attention)
	(and (introvert))
)

(:derived (capture_social_attention)
	(and (extrovert))
)

(:derived (move_randomly)
      (and (unscrupolous))
)


(:derived (self_centered)
      (and (disagreeable))
)


(:action move_to_random_location
    :parameters (?l1 ?l2 - location)
    :precondition (and 
            (at ?l1)
            (move_randomly)
            (random ?l2)
    )
    :effect (and (not(at ?l1))
    		  (at ?l2)
    		  (increase(no_actions)2)
    		  )
)


(:action reaching_production_location
    :parameters (?l1 ?l2 - location)
    :precondition (and 
            (at ?l1)
            (production_location ?l2)
            (new_block_available)
            (empty_robot)
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
    )
)


(:action pick_the_block
    :parameters (?l1 - location)
    :precondition (and 
            (at ?l1)
            (production_location ?l1)
            (new_block_available)
            (empty_robot)
            
    )
    :effect (and 
            (block_to_deliver)
            (not (empty_robot))
            (not(new_block_available))
    )
)

(:action reaching_human_location_near
    :parameters (?l1 ?l2 - location)
    :precondition (and 
    	    (capture_social_attention)
            (at ?l1)
            (human_location ?l2)
            (block_to_deliver)
            
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
    )
)


(:action reaching_human_location_far
    :parameters (?l1 ?l2 - location)
    :precondition (and 
            (at ?l1)
            (human_location ?l2)
            (block_to_deliver)
            (avoid_social_attention)            
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
    )
)


(:action deliver_the_block
    :parameters (?l1 - location)
    :precondition (and 
            (at ?l1)
            (human_location ?l1)
            (block_to_deliver)
            (human_present)
    )
    :effect (and 
            (not (block_to_deliver))
            (empty_robot)
            (block_added)
    )
)

(:action go_wait_crowd_room
    :parameters (?l1 ?l2 - location)
    :precondition (and 
    	    (capture_social_attention)
            (at ?l1)
            (wait_location ?l2)
            (empty_robot)
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
    )
)


(:action go_wait_not_crowd_room
    :parameters (?l1 ?l2 - location)
    :precondition (and 
    	    (avoid_social_attention)
            (at ?l1)
            (wait_location ?l2)
            (empty_robot)
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
            
    )
)

)



























