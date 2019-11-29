resource "consul_config_entry" "backend" {
  name = "${var.dc}-backend"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
  })
}
resource "consul_config_entry" "svc1" {
  name = "${var.dc}-svc1"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
  })
}
resource "consul_config_entry" "shared-ml-defaults" {
  name = "shared-ml"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
  })
}
resource "consul_config_entry" "ml-defaults" {
  name = "${var.dc}-ml"
  kind = "service-defaults"
  config_json = jsonencode({
    Protocol    = "http"
    MeshGateway = {
      Mode = "local"
    }
  })
}
