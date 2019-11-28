job "${ datacenter }-svc" {
  datacenters = ["${ datacenter }"]

  group "ml-grp" {
    network {
      mode = "bridge"
      mbits = 1
    }

    service {
      name = "ml"
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

    task "ml-task" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo:0.2.3"
        args = [
          "-text", "hello from shared in $NOMAD_DC"
        ]
      }

      resources {
        cpu    = 100
        memory = 100
      }
    }
  }
}
