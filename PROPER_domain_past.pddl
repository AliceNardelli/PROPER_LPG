(define (domain PROPER_navigation_domain)

(:requirements :adl :derived-predicates :strips :typing :conditional-effects :negative-preconditions :equality :fluents)

(:types
	room
)

(:functions
	(max_no_blocks)
	(no_blocks)
	(level_of_interaction)
        (social_attention)
        (inverse_extroversion_level)
        (level_of_agreeableness)
        (actual_agreeableness)
        (inverse_agree_level)
        
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

;extroversion actions
(:action chit_chat
    :precondition (and 
          (<=(social_attention)(level_of_interaction))  
    )
    :effect (and
    	    (increase (social_attention)(inverse_extroversion_level))

    )
)

(:action express_enthusiasm
    :precondition (and 
            (<=(social_attention)(level_of_interaction))
    )
    :effect (and
    	  (increase (social_attention)(inverse_extroversion_level))
          
    )
)

(:action approaching_human
    :precondition (and 
          (<=(social_attention)(level_of_interaction))
    )
    :effect (and
    	   (increase (social_attention)(inverse_extroversion_level))
          
    )
)

;agreeableness actions
(:action express_empathy
    :precondition (and 
            (<=(actual_agreeableness)(level_of_agreeableness))
    )
    :effect (and
    	  (increase (actual_agreeableness)(inverse_agree_level))
          
    )
)

(:action ask_help_human
    :precondition (and 
            (<=(actual_agreeableness)(level_of_agreeableness))
    )
    :effect (and
    	  (increase (actual_agreeableness)(inverse_agree_level))          
    )
)


;standard plan actions
(:action reaching_production_room
    :parameters (?l1 ?l2 - room)
    :precondition (and 
            (at ?l1)
            (production_room ?l2)
            (>=(social_attention)(level_of_interaction))
            (>=(actual_agreeableness)(level_of_agreeableness))
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
            (decrease (social_attention) 1)
            (decrease (actual_agreeableness) 1)
           
    )
)


(:action reaching_assembly_room
    :parameters (?l1 ?l2 - room)
    :precondition (and 
            (at ?l1)
            (assembly_room ?l2)
            (>=(social_attention)(level_of_interaction))
            (>=(actual_agreeableness)(level_of_agreeableness))
    )
    :effect (and 
            (not (at ?l1))
            (at ?l2)
            (decrease (social_attention) 1)
            (decrease (actual_agreeableness) 1)
            
    )
)


(:action present_assembly_room
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (assembly_room ?l1)
            (>=(social_attention)(level_of_interaction))
            (>=(actual_agreeableness)(level_of_agreeableness))
    )
    :effect (and 
            (presented_task ?l1)
            (decrease (social_attention) 1)
            (decrease (actual_agreeableness) 1)
           
    )
)


(:action present_production_room
    :parameters (?l1 - room)
    :precondition (and 
            (at ?l1)
            (production_room ?l1)
            (>=(social_attention)(level_of_interaction))
            (>=(actual_agreeableness)(level_of_agreeableness))
    )
    :effect (and 
            (presented_task ?l1)
            (decrease (social_attention) 1)
            (decrease (actual_agreeableness) 1)
           
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
            (>=(social_attention)(level_of_interaction))
            (>=(actual_agreeableness)(level_of_agreeableness))
    )
    :effect (and
    	    (not(empty_robot)) 
            (block_to_deliver) 
            (decrease (social_attention) 1)
            (decrease (actual_agreeableness) 1)
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
            (>=(social_attention)(level_of_interaction))
            (>=(actual_agreeableness)(level_of_agreeableness))

             
    )
    :effect (and
    	    (not(block_to_deliver)) 
            (empty_robot)
            (increase (no_blocks) 1)
            (decrease (social_attention) 1)
            (decrease (actual_agreeableness) 1)
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
