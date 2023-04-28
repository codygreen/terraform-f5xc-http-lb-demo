variable "xc_tenant" {
  type = string
}
  
variable "volterra_token" {
  type = string
}

data "http" "whoami" {
  method = "GET"
  url    = format("https://%s.console.ves.volterra.io/api/web/custom/namespaces/system/whoami?report_fields", var.xc_tenant)
  request_headers = {
    Accept        = "application/json"
    Authorization = format("APIToken %s", var.volterra_token)
  }
}

locals {
    namespace_roles = jsondecode(data.http.whoami.response_body)["namespace_roles"]
    index = index(local.namespace_roles.*.role, "ves-io-power-developer-role")
    namespace = local.namespace_roles.*.namespace[local.index]
}

output "namespace" {
    value = local.namespace
}