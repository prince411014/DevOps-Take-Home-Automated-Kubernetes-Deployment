# DevOps-Take-Home-Automated-Kubernetes-Deployment
automate the deployment of a simple web application to a Kubernetes cluster

**Owner / GitHub username:** `prince411014`  
**Repository name:** `devops-takehome-automated-k8s-deployment`

## Overview
This repository demonstrates an automated pipeline that builds, containerizes, and deploys a simple "Hello, World" web application to a managed Kubernetes cluster using Infrastructure as Code (Terraform), containerization (Docker), and CI/CD (GitHub Actions).

## What's included
- `app/` — simple Node.js web app (hello world).
- `Dockerfile` — multi-stage, optimized image.
- `k8s/` — Kubernetes manifests (Deployment, Service, Ingress).
- `helm/` — basic Helm chart (optional bonus).
- `terraform/` — Terraform configuration to provision an EKS cluster (using `terraform-aws-modules/eks/aws`).
- `.github/workflows/ci-cd.yaml` — GitHub Actions pipeline to build, push image, and deploy to cluster.
- `README.md` — this file.

## Quick summary of the flow
1. Developer pushes to `main`.
2. GitHub Actions builds Docker image, pushes to Docker Hub (or another registry).
3. Workflow updates cluster (using stored credentials / kubeconfig) and applies Kubernetes manifests (or Helm chart).
4. Application becomes publicly accessible via LoadBalancer/Ingress.

## How to use (high-level)
> **Prerequisites:** AWS account (if using Terraform/EKS), Terraform CLI, kubectl, Docker, GitHub account.

1. Fork or clone this repository and replace `prince411014` where appropriate.
2. Provision infrastructure:
   - `cd terraform`
   - Edit `variables.tf` for region and cluster name (or provide via CLI/terraform.tfvars).
   - `terraform init`
   - `terraform apply` (ensure AWS credentials are configured).
   - After apply, retrieve kubeconfig (or use the generated kubeconfig path printed by Terraform).
3. Configure GitHub repository Secrets:
   - `DOCKERHUB_USERNAME` — Docker Hub username.
   - `DOCKERHUB_TOKEN` — Docker Hub access token or password.
   - `KUBE_CONFIG_DATA` — Base64-encoded kubeconfig (optional alternative to configuring AWS in workflow).
   - (If using ECR/GCR, configure appropriate credentials and update workflow.)
4. Push to `main` — GitHub Actions will run and deploy.

## Design choices
- **Terraform (IaC):** We use `terraform-aws-modules/eks/aws` to keep the EKS provisioning concise and best-practice.
- **Docker multi-stage build:** Keeps image small and secure.
- **Kubernetes manifests:** Simple, readable YAML; can be templated with Helm (provided).
- **CI/CD with GitHub Actions:** Native to the repository and easy to connect with GitHub Secrets.

## Live URL
Once deployed, the application will be reachable at the public IP or DNS of the Service/Ingress. After you run the pipeline & apply manifests, find the external IP via:
```bash
kubectl get svc -n default
# or
kubectl get ingress
```

## Notes
- This repo is a template — credentials & sensitive values must be configured by the user.
- The Terraform code is intentionally minimal; you may want to add VPC CIDR, NAT Gateway settings, and other production considerations.

--- 
Feel free to ask for edits — I can:
- Convert Terraform to GKE/AKS,
- Add automated ECR authentication,
- Expand Helm chart values and templates,
- Add monitoring (Prometheus/Grafana) or image scanning in CI.

