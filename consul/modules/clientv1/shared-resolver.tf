resource "consul_config_entry" "shared-svc-resolver" {
  name = "svc-shared"
  kind = "service-resolver"
  config_json = jsonencode({
    redirect = {
      service    = "svc-shared"
      datacenter = "shared"
    }
  })
}
