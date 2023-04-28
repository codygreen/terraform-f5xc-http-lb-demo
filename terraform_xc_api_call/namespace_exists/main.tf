variable "xc_tenant" {
  type = string
}
  
variable "volterra_token" {
  type = string
}

variable "namespace" {
  type = string
}

data "http" "namespaces" {
  method = "GET"
  url    = format("https://%s.console.ves.volterra.io/api/web/namespaces", var.xc_tenant)
  request_headers = {
    Accept        = "application/json"
    Authorization = format("APIToken %s", var.volterra_token)
  }
}

locals {
    namespaces = jsondecode(data.http.namespaces.response_body).items
    index = try(
      index(local.namespaces.*.name, var.namespace) > 0 ? true : false,
      false
    )
}

output "namespace_exists" {
    value = local.index
}