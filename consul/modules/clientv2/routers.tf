resource "consul_config_entry" "backend_router" {
  name = "${var.dc}-backend"
  kind = "service-router"

  config_json = jsonencode({
    Routes = [
      {
        Match = {
          HTTP = {
            PathPrefix = "/v2"
          }
        }
        Destination = {
          Service = "${var.dc}-svc2"
        }
      },
      {
        Match = {
          HTTP = {
            PathPrefix = "/"
          }
        }
        Destination = {
          Service = "${var.dc}-svc1"
        }
      },
    ]
  })

  depends_on = [
    consul_config_entry.svc1,
    consul_config_entry.svc2,
  ]
}
