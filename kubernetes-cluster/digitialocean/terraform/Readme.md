# Steps for spinning up Kubernetes cluster

## Create the cluster

### Pre-Requisites
* Generate the Digital ocean Personal Access Token (or API Key) with write permissions here https://www.digitalocean.com/docs/api/create-personal-access-token/
* Install Terraform cli https://learn.hashicorp.com/terraform/getting-started/install.html
* Install Kuberntes CLI https://kubernetes.io/docs/tasks/tools/install-kubectl/

### Steps
```
git clone https://github.com/cicd-deployr/infrastructure.git
cd infrastructure/kubernetes-cluster/digitalocean/terraform/
export ACCESS_TOKEN=<digitialocean access token>
terraform init
terraform plan -var "do_token=${ACCESS_TOKEN}"
terraform validate
terraform apply -var "do_token=${ACCESS_TOKEN}" -auto-approve
```

### Validation
```
terraform show
```

### Access the Kubernetes cluster
```
export KUBECONFIG=kubeconfig.yaml
kubectl get nodes
```

### Destroy the Kubernetes cluster
```
terraform destroy -var "do_token=${ACCESS_TOKEN}" -auto-approve
```

### Note
* Dont delete `*.tfstate` files - These are crucial for terraform to maintain state