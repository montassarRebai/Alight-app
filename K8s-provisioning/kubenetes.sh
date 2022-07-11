while : ; do
printf "I) *********  This Script Must be Running on Master node Only ******** : \n"
printf "1) Kubernetes Nodes : \n"
printf "2) Kubernetes Kube-system Pods: \n"
printf "3) Check Kubernetes Cluster Infos  : \n"
printf "4) Kubernetes Master Node Ressource  : \n"
printf "5) Kubernetes Worker 1 Node Ressource  : \n"
printf "6) Kubernetes Worker 2 Node Ressource  : \n"
printf "7) Exit \n"
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
  
   printf "till next time \n"
   exit
    ;;
  
  *)
   printf "WTF are you doing ! \n"
    ;;
esac
done
