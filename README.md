# DevOps-Take-Home-Automated-Kubernetes-Deployment
automate the deployment of a simple web application to a Kubernetes cluster

**Owner / GitHub username:** `prince411014`  
**Repository name:** `devops-takehome-automated-k8s-deployment`

This repository — built and maintained by Prince Kumar
 — demonstrates a fully automated DevOps workflow that builds, packages, and deploys a simple “Hello, World” web application to Amazon EKS using:

🌩️ Terraform for Infrastructure as Code (IaC)

🐳 Docker for containerization

☸️ Kubernetes for orchestration

⚙️ GitHub Actions for CI/CD automation

The aim is to showcase modern DevOps practices for scalable, secure, and automated cloud-native deployments.

🧩 Repository Structure
devops-takehome-automated-k8s-deployment/
├── app/                    # Node.js Hello World app
│   └── index.js
├── Dockerfile              # Multi-stage optimized image
├── k8s/                    # Kubernetes manifests (Deployment, Service, Ingress)
├── helm/                   # Optional Helm chart (templated manifests)
├── terraform/              # Terraform code to provision EKS
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── .github/workflows/
│   └── ci-cd.yaml          # GitHub Actions pipeline
└── README.md               # Documentation (this file)

🔄 CI/CD Workflow
Pipeline Flow

👨‍💻 Developer pushes code to the main branch.

⚙️ GitHub Actions pipeline triggers automatically.

🏗️ Builds and tags Docker image → pushes to Docker Hub.

☸️ Deploys the latest image to EKS using kubectl apply.

🌐 App becomes publicly accessible via LoadBalancer/Ingress.

⚙️ Setup Instructions
Prerequisites

AWS Account

Terraform CLI

Docker

kubectl

GitHub Account

Steps

Provision EKS using Terraform

cd terraform
terraform init
terraform apply


Configure AWS credentials before running.

Configure GitHub Secrets

Secret Name	Description
DOCKERHUB_USERNAME	Your Docker Hub username
DOCKERHUB_TOKEN	Docker Hub access token
KUBE_CONFIG_DATA	Base64 encoded kubeconfig for your EKS cluster

Trigger Deployment
Push to main branch → GitHub Actions runs the pipeline → App deploys automatically.

🧠 Design Highlights

✅ Terraform (IaC):
Modular and reusable setup using the official terraform-aws-modules/eks/aws.

✅ Multi-Stage Docker Build:
Ensures lightweight, secure, and efficient image creation.

✅ Kubernetes Manifests:
Defines Deployment, Service, and Ingress for scalability and load balancing.

✅ GitHub Actions CI/CD:
Automated build, push, and deploy workflows triggered on each commit.

✅ Optional Helm Chart:
Reusable chart for templated Kubernetes deployment.

🌍 Accessing the Application

After deployment, find the public endpoint:

kubectl get svc -n default
# or
kubectl get ingress


Visit the EXTERNAL-IP or DNS in your browser to see the “Hello, World” response.

👨‍💻 Author Declaration

I, Prince Kumar (📧 prince.kumar22@outlook.com
),
personally designed and developed this project to demonstrate my DevOps expertise in Kubernetes, Terraform, Docker, and CI/CD automation.

This project reflects my hands-on proficiency in:

Cloud-native architecture (AWS & Azure)

Scalable deployments with EKS/AKS

Infrastructure as Code (Terraform)

CI/CD best practices (GitHub Actions)

Automation with Python & Bash

💡 Created with passion for automation, scalability, and cloud innovation.

🛠️ Tech Stack
Category	Technologies
Cloud	AWS (EKS)
IaC	Terraform
Orchestration	Kubernetes, Helm
CI/CD	GitHub Actions
Containerization	Docker
Monitoring (optional)	Prometheus, Grafana
Languages	YAML, HCL, JavaScript (Node.js)
