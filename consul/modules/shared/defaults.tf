resource "consul_config_entry" "svc-shared-defaults" {
  name = "svc-shared"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
    MeshGateway = {
      mode = "local"
    }
  })
}
