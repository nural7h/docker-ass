chmod +x ./kubeclt_setup/setup_k8s_v2.sh
chmod +x ./kubeclt_setup/k8s.sh

chmod +x ./dashboard/kubectl.sh
chmod +x ./dashboard/fix_permissions.sh

./kubeclt_setup/setup_k8s_v2.sh
./kubeclt_setup/k8s.sh

./dashboard/kubectl.sh
./dashboard/fix_permissions.sh

kubectl apply -f ./k8s/
kubectl get deployments
kubectl get services
kubectl get pods

kubectl proxy