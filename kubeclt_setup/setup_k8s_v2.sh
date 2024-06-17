#!/usr/bin/sh

set -e

# Install Kubernetes Dashboard – no spaces in the url!
kubectl apply -f   https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
# Patch the dashboard to allow skipping login
kubectl patch deployment kubernetes-dashboard -n kubernetes-dashboard --type 'json' -p '[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value":"--enable-skip-login"}]'

# Install Metrics Server – no spaces in the url
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# Patch the metrics server to work with insecure TLS
kubectl patch deployment metrics-server -n kube-system --type 'json' -p '[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'

# Create a k8s yaml fie to create a user
cat > dashboard-user.yaml << EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: dashboard-user
  namespace: kubernetes-dashboard
EOF

# Create a k8s yaml file to associate the new user with the cluster-admin role
cat > dashboard-clusterrolebinding.yaml << EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: dashboard-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: dashboard-user
  namespace: kubernetes-dashboard
EOF

# Apply the two k8s files and then remove them
kubectl apply -f dashboard-user.yaml
kubectl apply -f dashboard-clusterrolebinding.yaml
rm dashboard-user.yaml dashboard-clusterrolebinding.yaml

# Cleanup any existing admin stuff to prevent permission errors
kubectl delete clusterrolebinding serviceaccount-cluster-admin
kubectl create clusterrolebinding serviceaccount-cluster-admin --clusterrole=cluster-admin --user=system:serviceaccount:kubernetes-dashboard:kubernetes-dashboard

