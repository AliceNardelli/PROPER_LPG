from flask import Flask, request, jsonify
import os
import shutil
import subprocess
import json
import time
import numpy as np

def knowledge():
    planner_path = "/home/alice/PROPER_LPG/"
    if os.path.isfile(planner_path+'/PROPER_domain.pddl'):
        output_path=planner_path+'/PROPER_domain.pddl'
        with open(output_path, "r") as plan_file:
            raw_plan = plan_file.readlines()
        plan=[]
        t=False
        action_effect={}
        last_action=""
        list_action=[]
        actions=[]
        for p in raw_plan:
            plan.append(p)
            if (":durative-action" in p) or (":durative-action" in p):
                t=False
                last_action=p.replace(":durative-action","")
                action_effect[last_action]=""
                list_action=[]
                actions.append(last_action)
            if t==True:
                if "at end" in p:
                    list_action.append(p.replace("at end","").replace(" ",""))
                    action_effect[last_action]=list_action
            if ":effect" in p:
                t=True
        for a in actions:
            print(a)
            print(action_effect[a])
            print("----------------------")
        
    else:
        print("Plan not found")


def plan():
    planner_path = "/home/alice/PROPER_LPG/"
    os.chdir (planner_path)
    command =  './lpg++ -o PROPER_domain.pddl -f PROPER_problem.pddl -n 1 -force_neighbour_insertion'
    #run the planner
    fd_process = subprocess.Popen([command], stdout=subprocess.PIPE, shell=True)
    (out, err) = fd_process.communicate()
    fd_exit = fd_process.returncode
    if os.path.isfile(planner_path+'/plan_PROPER_problem.pddl_1.SOL'):
        output_path=planner_path+'/plan_PROPER_problem.pddl_1.SOL'
        with open(output_path, "r") as plan_file:
            raw_plan = plan_file.readlines()
        plan=[]
        for p in raw_plan:
           if p[0] !=";":
            plan.append(p)
        ret=plan.remove("\n") 
        while ret==None:  
            try:
              ret=plan.remove("\n")
            except:
              ret="alice"    
        actions=[]
        for i in plan:
            actions.append(i[i.find("(")+1:i.find(")")])
        print(actions)
        return actions
    else:
        print("Plan not found")
   

if __name__ == "__main__":
   knowledge()