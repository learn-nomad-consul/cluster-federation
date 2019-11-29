resource "consul_config_entry" "ml-resolver" {
  name = "shared-ml"
  kind = "service-resolver"
  config_json = jsonencode({
    redirect = {
      service    = "shared-ml"
      datacenter = "shared"
    }
  })
}
