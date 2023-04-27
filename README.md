# F5 Distributed Cloud (XC) Terraform HTTP Load Balancer Examples

Demonstrate creation of an F5 Distributed Cloud HTTP Load Balancer using Terraform

## HTTPS Load Balancer with Shared TLS Certificate

The `https_shared_tls_cert` folder demonstrates the creation of an HTTPS load balancer via Terraform that references a shared TLS certificate for the XC tenant.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_volterra"></a> [volterra](#requirement\_volterra) | 0.11.21 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_volterra"></a> [volterra](#provider\_volterra) | 0.11.21 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [volterra_http_loadbalancer.lb_https](https://registry.terraform.io/providers/volterraedge/volterra/0.11.21/docs/resources/http_loadbalancer) | resource |
| [volterra_origin_pool.op](https://registry.terraform.io/providers/volterraedge/volterra/0.11.21/docs/resources/origin_pool) | resource |
| [volterra_http_loadbalancer_state.lb](https://registry.terraform.io/providers/volterraedge/volterra/0.11.21/docs/data-sources/http_loadbalancer_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_p12_file"></a> [api\_p12\_file](#input\_api\_p12\_file) | Path to API P12 file | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Application Fully Qualified Domain Name (FQDN) | `string` | n/a | yes |
| <a name="input_k8s_cluster"></a> [k8s\_cluster](#input\_k8s\_cluster) | K8s Cluster Name | `string` | `"demo"` | no |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | K8s Namespace | `string` | n/a | yes |
| <a name="input_k8s_service"></a> [k8s\_service](#input\_k8s\_service) | K8s Service Name | `string` | `"nginx"` | no |
| <a name="input_k8s_service_port"></a> [k8s\_service\_port](#input\_k8s\_service\_port) | K8s Service Port | `number` | `8080` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all resources | `string` | n/a | yes |
| <a name="input_provider_url"></a> [provider\_url](#input\_provider\_url) | Volterra API URL | `string` | n/a | yes |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | XC Tenant Name | `string` | n/a | yes |
| <a name="input_tls_certificate_name"></a> [tls\_certificate\_name](#input\_tls\_certificate\_name) | TLS Wildcard Certificate Name | `string` | n/a | yes |
| <a name="input_xc_public_ip_name"></a> [xc\_public\_ip\_name](#input\_xc\_public\_ip\_name) | XC Public IP Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip"></a> [ip](#output\_ip) | n/a |
