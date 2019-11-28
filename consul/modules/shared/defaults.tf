resource "consul_config_entry" "svc-ml" {
  name = "ml"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
  })
}
