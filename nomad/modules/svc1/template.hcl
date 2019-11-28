job "${ datacenter }-svc1" {
  datacenters = ["${ datacenter }"]

  group "svc1" {
    network {
      mode = "bridge"
    }

    service {
      name = "svc1"
      port = 5678
      connect {
        sidecar_service {}
        sidecar_task {
          resources {
            cpu = 50
            memory = 30
          }
        }
      }
    }

    task "svc1" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo:0.2.3"
        args = [
          "-text", "hello from service1 in $NOMAD_DC"
        ]
      }

      resources {
        cpu    = 100
        memory = 100
      }
    }
  }
}
