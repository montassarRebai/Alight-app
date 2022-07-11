while : ; do
printf "I) *********   Script  Running    ******** : \n"
printf "\n"
printf "1)           Kubernetes Nodes : \n"
printf "\n"
printf "2)           Kubernetes Kube-system Pods: \n"
printf "\n"
printf "3)           Check Kubernetes Cluster Infos  : \n"
printf "\n"
printf "4)           Kubernetes Master Node Ressource  : \n"
printf "\n"
printf "5)           Kubernetes Worker 1 Node Ressource  : \n"
printf "\n"
printf "6)           Kubernetes Worker 2 Node Ressource  : \n"
printf "\n"
printf "7)           Kubernetes Cluster Health  : \n"
printf "\n"
printf "8)           Kubernetes Cluster Persistent Volumes  : \n"
printf "\n"
printf "9) Exit \n"
read choice

echo -n " Starting Task $choice  "

case $choice in

  1)
   
   kubectl get nodes
     printf "Done \n"
    ;;

  2)
  kubectl get pods --all-namespaces
    printf "Done \n"
    ;;

  3)
  kubectl cluster-info
    printf "Done \n"
    ;;
    
  4)
  kubectl describe node master
   printf "Done \n"
    ;;
  
   5)
  kubectl describe node worker1
   printf "Done \n"
    ;; 
  
    6)
  kubectl describe node worker2
   printf "Done \n"
    ;;
 
    7)
  
   kubectl get cs
   exit
    ;;
    8)
  
   kubectl get pvc -A
   printf "Done \n"
    ;;
    9)
 printf "***************  See you next Time ***************" 
   
   exit
    ;;
  
  *)
   printf "WTF are you doing ! \n"
    ;;
esac
done
