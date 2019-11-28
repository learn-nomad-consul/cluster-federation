resource "consul_config_entry" "backend" {
  name = "backend"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
  })
}
resource "consul_config_entry" "svc1" {
  name = "svc1"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
  })
}
resource "consul_config_entry" "svc2" {
  name = "svc2"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "tcp"
  })
}
resource "consul_config_entry" "ml-defaults" {
  name = "ml"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
    MeshGateway = {
      Mode = "local"
    }
  })
}
