#!/bin/bash
kubectl create namespace nexus ;
sleep 2
kubectl apply -f /home/master/Desktop/kubernetes/ansible/roles/Nexus/tasks/nexus-dep.yaml
sleep 5
kubectl apply -f /home/master/Desktop/kubernetes/ansible/roles/Nexus/tasks/nexus-ser.yaml
 
