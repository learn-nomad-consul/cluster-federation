resource "consul_config_entry" "ml-resolver" {
  name = "ml"
  kind = "service-resolver"
  config_json = jsonencode({
    redirect = {
      service    = "ml"
      datacenter = "shared"
    }
  })
}
