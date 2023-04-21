from load_ontology import *

if __name__ == "__main__":
   #populate_ontology()
   #initialize_functions_predicates()
   #read_the_problem()
   command =  './lpg++ -o prova_domain.pddl -f prova_problem.pddl -n 1 -force_neighbour_insertion'
   #planning(command)
   plan_path="/home/alice/PROPER_LPG/plan_prova_problem.pddl_1.SOL"
   actions_to_execute=read_plan(plan_path)
   print(actions_to_execute)
   #update_ontology(a) #for each action properly executed
   command =  './lpg++ -o prova_domain.pddl -f prova_problem_copia.pddl -n 1 -force_neighbour_insertion'
   update_problem('/prova_problem.pddl','/prova_problem_copia.pddl')