resource "consul_config_entry" "backend_router" {
  name = "backend"
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
          Service = "svc1" # change this to svc2 like for client2 to see it fails the central config set in client2 dc is overriden in this one
        }
      },
      {
        Match = {
          HTTP = {
            PathPrefix = "/"
          }
        }
        Destination = {
          Service = "svc1"
        }
      },
    ]
  })

  depends_on = [
    consul_config_entry.svc1,
  ]
}
