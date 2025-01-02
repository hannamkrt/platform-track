# Platform track
This is the repository used for the assignment for the Platform Engineering Track.

## Docker compose
Local - run `docker-compose up -d` to start and run the containers (detached).

## Plan and apply Terraform config
First, run `terraform init`.\
Then, run `terraform plan`.\
Finally, run `terraform apply`.

## Command to create secrets on Azure
In this repo I used two secrets:
1. `kubectl create secret generic mariadb-secret --namespace=mariadb --from-env-file=secrets.env`
2. `kubectl create secret generic mysql-secret --namespace=wordpress --from-env-file=secrets.env`

## Command to port-forward a service for testing
http-echo: \
`kubectl port-forward svc/http-echo-service 9080:9080 -n http-echo`

Grafana: \
`kubectl port-forward svc/grafana -n grafana 3000:80`

## Ingress controller
Install with helm: 
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx
```

Add to hosts file: 
```
172.189.38.172 http-echo.platformtrack.com
172.189.38.172 platformtrack.com
172.189.38.172 grafana.platformtrack.com
```

## Prometheus & Grafana with Helm
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack --namespace prometheus
helm install grafana grafana/grafana --namespace grafana
```

To expose Grafana:\
`kubectl expose svc grafana -n grafana --type=LoadBalancer --name=grafana-lb`

## Horizontal Pod Autoscalers
Install metrics-server:\
`kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml`

Commands to check metrics:\
`kubectl top nodes`\
`kubectl top pods --all-namespaces`

Apply autoscaling to wordpress for example:\
`kubectl autoscale deployment wordpress -n wordpress --cpu-percent=60 --min=1 --max=5`

## Sources
[Docker compose](https://docs.docker.com/compose/gettingstarted/)

[Terraform - Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster)

[Terraform - Youtube tutorial](https://www.youtube.com/watch?v=wPD_zdkfRw8)

[Prometheus & Grafana - guide](https://signoz.io/guides/how-to-install-prometheus-and-grafana-on-docker/)

[Wordpress Kubernetes manifest - guide](https://engr-syedusmanahmad.medium.com/wordpress-on-kubernetes-cluster-step-by-step-guide-749cb53e27c7)

[Azure authentication in Github Actions - example](https://github.com/Azure/login/blob/master/.github/workflows/azure-login-positive.yml)

[Terraform in Github Actions - example](https://github.com/hashicorp-education/learn-terraform-github-actions/blob/main/.github/workflows/terraform.yml)
