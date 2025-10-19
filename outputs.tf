output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig" {
  description = "Kubeconfig content (base64 encoded)"
  value = module.eks.kubeconfig
  sensitive = true
}
