kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/22.0.5/kubernetes/keycloaks.k8s.keycloak.org-v1.yml -n keycloak
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/22.0.5/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml -n keycloak
kubectl apply -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/22.0.5/kubernetes/kubernetes.yml -n keycloak
minikube addons enable ingress
wget -q -O - https://raw.githubusercontent.com/keycloak/keycloak-quickstarts/latest/kubernetes/keycloak.yaml > keycloak.yaml
sed 's/\$\$VERSION\$\$/22.0.5/g' keycloak.yaml > tmp.yaml
mv tmp.yaml keycloak.yaml
kubectl create -f keycloak.yaml -n keycloak
wget -q -O - https://raw.githubusercontent.com/keycloak/keycloak-quickstarts/latest/kubernetes/keycloak-ingress.yaml | sed "s/KEYCLOAK_HOST/keycloak.$(minikube ip).nip.io/" > keycloak-ingress.yaml
yq '.metadata.namespace = "keycloak"' -i keycloak-ingress.yaml
kubectl create -f keycloak-ingress.yaml

