resource "consul_config_entry" "ml-defaults" {
  name = "ml"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
  })
}
