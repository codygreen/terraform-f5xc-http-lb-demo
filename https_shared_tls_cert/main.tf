# Create XC LB config
provider "volterra" {
  api_p12_file     = var.api_p12_file
  url              = var.provider_url
}

locals {
  prefix = var.prefix
  service = var.k8s_service
  namespace = var.k8s_namespace
  site_name = var.k8s_cluster
}

resource "volterra_origin_pool" "op" {
  name        = format("%s-op", local.prefix)
  namespace   = local.namespace
  description = format("Demo origin pool")
  origin_servers {
    k8s_service {
      service_name = format("%s.%s", local.service, local.namespace)

      site_locator {
        site {
          tenant    = var.tenant
          namespace = "system"
          name      = local.site_name
        }
      }
      outside_network = true
    }
  }
  no_tls                 = true
  port                   = var.k8s_service_port
  endpoint_selection     = "LOCAL_PREFERRED"
  loadbalancer_algorithm = "LB_OVERRIDE"
}

resource "volterra_http_loadbalancer" "lb_https" {

  name                            = format("%s-demo", local.prefix)
  namespace                       = local.namespace
  description                     = format("Demo HTTPS loadbalancer")
  domains                         = [var.domain]
  advertise_on_public_default_vip = false
  advertise_on_public {
    public_ip {
      name=var.xc_public_ip_name
      namespace="shared"
    }
  }
  default_route_pools {
    pool {
      name      = volterra_origin_pool.op.name
      namespace = local.namespace
    }
    weight = 1
  }
  routes {
    simple_route {
      http_method          = "ANY"
      disable_host_rewrite = true
      path {
        prefix = "/"
      }
      origin_pools {
        pool {
          name      = volterra_origin_pool.op.name
          namespace = local.namespace
        }
        weight = 1
      }
    }
  }
  
  https {
    http_redirect = false
    add_hsts = false
    tls_cert_params {
      tls_config {
        default_security = true
      }
      no_mtls = true
      certificates  {
        name = var.tls_certificate_name
        namespace = "shared"
      }
    }
  }
}

data volterra_http_loadbalancer_state lb {
  name = volterra_http_loadbalancer.lb_https.name
  namespace = volterra_http_loadbalancer.lb_https.namespace
}