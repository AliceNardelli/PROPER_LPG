#!/usr/bin/env python
from load_ontology import *
import roslib
import rospy
import smach
import smach_ros
import random


# define state Foo
class State_Init(smach.State):
   def __init__(self):
      smach.State.__init__(self, 
                           outcomes=['outcome1'],
                           input_keys=['domain_path','init_pb','problem_path'],
                           )

   def execute(self, userdata):
        rospy.loginfo('Executing state INIT')
        rospy.loginfo('copy pb in the correct file')
        with open(userdata.init_pb,'r') as firstfile, open(userdata.problem_path,'w') as secondfile:
            for line in firstfile:
                secondfile.write(line)
        rospy.loginfo('Reading domain and populate ontology')
        populate_ontology(userdata.domain_path)
        rospy.loginfo('Initialize function and predicates in the ontology')
        initialize_functions_predicates()
        rospy.loginfo('Read the problem and set the initial values of predicates  and functions')
        read_the_problem(userdata.problem_path)      
        return 'outcome1'
      


# define state Bar
class Planning(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['outcome2'],
                             input_keys=['command','planning_folder'])
        
    def execute(self, userdata):
        rospy.loginfo('planning')
        return_code=planning(userdata.command,userdata.planning_folder)  
        print(return_code)
        while return_code!=0:
            return_code=planning(userdata.command,userdata.planning_folder)  
            print(return_code)
        return 'outcome2'
        
        

class GetActions(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['outcome3'],
                             input_keys=['plan_path'],
                             output_keys=['executing_actions_out'])
                             
        
    def execute(self, userdata):
        rospy.loginfo('Reading Actions to execute')
        print(userdata.plan_path)   
        userdata.executing_actions_out=read_plan(userdata.plan_path)
        return 'outcome3'
    
class ExecAction(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['outcome4','outcome5'],
                             input_keys=['executing_actions'],
                             output_keys=['updated_actions','action']) 
    def execute(self, userdata):
        rospy.loginfo('Executing actions')
        num =random.randint(0, 9)
        if num >7:
            rospy.loginfo('Action Failed')
            return "outcome4"
        else:
            ac=userdata.executing_actions.pop(0)
            rospy.loginfo('Action executed: '+ac)
            userdata.action=ac
            userdata.updated_actions=userdata.executing_actions
            return 'outcome5'
        
class WriteProblem(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['outcome7'],
                             input_keys=['pb_path'],)
        
    def execute(self, userdata):
        rospy.loginfo('Writing a new plan')
        update_problem(userdata.pb_path)
        return 'outcome7'
    
class UpdateOntology(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['outcome6','outcome7'],
                             input_keys=['action','executing_actions'],)
        
    def execute(self, userdata):
        rospy.loginfo('Update_ontology')
        print(userdata.action)
        update_ontology(userdata.action)
        if userdata.executing_actions==[]:
                rospy.loginfo('All action executed')
                return "outcome6"
        return 'outcome7'

class Finish(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['outcome7'],
                             )
        
    def execute(self,userdata):
        rospy.loginfo('Finishhh')
        return 'outcome7'


def main():
    rospy.init_node('smach_example_state_machine')

    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['outcome8'])
    sm.userdata.path_domain='/home/alice/PROPER_LPG/new_domain.pddl'
    sm.userdata.path_problem='/home/alice/PROPER_LPG/prova_problem.pddl'
    sm.userdata.path_init_problem='/home/alice/PROPER_LPG/init_problem.pddl'
    sm.userdata.command_start='./lpg++ -o new_domain.pddl -f prova_problem.pddl -n 1 -force_neighbour_insertion -inst_with_contraddicting_objects'
    sm.userdata.folder ='/home/alice/PROPER_LPG/'
    sm.userdata.path_plan ='/home/alice/PROPER_LPG/plan_prova_problem.pddl_1.SOL'
    sm.userdata.actions =[]
    sm.userdata.a="a"
    # Open the container
    with sm:
      # Add states to the container
      smach.StateMachine.add('INIT', State_Init(), 
                              transitions={'outcome1':'PLAN'},
                              remapping={'domain_path':'path_domain', 
                                         'problem_path':'path_problem',
                                         'init_pb':'path_init_problem'
                                        })
      smach.StateMachine.add('PLAN', Planning(), 
                              transitions={'outcome2':'GET_ACTIONS'},
                              remapping={'command':'command_start',
                                         'planning_folder':'folder'})
      
      smach.StateMachine.add('GET_ACTIONS', GetActions(), 
                              transitions={'outcome3':'EXEC'},
                              remapping={'plan_path':'path_plan',
                                         'executing_actions_out':'actions',
                                       })
      
      smach.StateMachine.add('EXEC', ExecAction(), 
                        transitions={'outcome4':'WRITE_PLAN',
                                     'outcome5':'UPDATE_ONTOLOGY',
                                     },
                        remapping={'executing_actions':'actions',
                                   'updated_actions':'actions',
                                   'action':"a" 
                                 })
      
      smach.StateMachine.add('WRITE_PLAN', WriteProblem(), 
                  transitions={'outcome7':'PLAN'},
                  remapping={'pb_path':'path_problem'
                                       })
      
      smach.StateMachine.add('UPDATE_ONTOLOGY', UpdateOntology(), 
                  transitions={'outcome7':'EXEC',
                               'outcome6': 'FINISH'},
                  remapping={'action':'a',
                             'executing_actions':'actions'
                           })
      
      smach.StateMachine.add('FINISH', Finish(), 
                  transitions={'outcome7':'outcome8'},
                  )
   
    # Create and start the introspection server for visualization
    #sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
    #sis.start()

    # Execute the state machine
    outcome = sm.execute()

    # Wait for ctrl-c to stop the application
    rospy.spin()
    #sis.stop()

if __name__ == '__main__':
      main()

    