job "${ datacenter }-svc2" {
  datacenters = ["${ datacenter }"]

  group "svc2" {
    network {
      mode = "bridge"
    }

    service {
      name = "svc2"
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

    task "svc2" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo:0.2.3"
        args = [
          "-text", "hello from service2 in $NOMAD_DC"
        ]
      }

      resources {
        cpu    = 100
        memory = 100
      }
    }
  }
}
