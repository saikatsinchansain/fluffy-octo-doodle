kubectl delete -f keycloak-ingress.yaml -n keycloak
rm keycloak-ingress.yaml
kubectl delete -f keycloak.yaml -n keycloak
rm keycloak.yaml
kubectl delete -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/22.0.5/kubernetes/kubernetes.yml -n keycloak
kubectl delete -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/22.0.5/kubernetes/keycloakrealmimports.k8s.keycloak.org-v1.yml -n keycloak
kubectl delete -f https://raw.githubusercontent.com/keycloak/keycloak-k8s-resources/22.0.5/kubernetes/keycloaks.k8s.keycloak.org-v1.yml -n keycloak
kubectl delete all --all -n keycloak
