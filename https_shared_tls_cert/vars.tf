variable "api_p12_file" {
  type = string
  description = "Path to API P12 file"
}

variable "domain" {
  type = string
  description = "Application Fully Qualified Domain Name (FQDN)"
}

variable "k8s_service" {
  type = string
  description = "K8s Service Name"
  default = "nginx"
}

variable "k8s_service_port" {
  type = number
  description = "K8s Service Port"
  default = 8080
}
 
variable "k8s_cluster" {
  type = string
  description = "K8s Cluster Name"
  default = "demo"
}

variable "k8s_namespace" {
  type = string
  description = "K8s Namespace"
}

variable "provider_url" {
  type = string
  description = "Volterra API URL"
}

variable "prefix" {
  type = string
  description = "Prefix for all resources"
}

variable "tenant" {
  type = string
  description = "XC Tenant Name"
}

variable "tls_certificate_name" {
  type = string
  description = "TLS Wildcard Certificate Name"
}

variable "xc_public_ip_name" {
  type = string
  description = "XC Public IP Name"
}