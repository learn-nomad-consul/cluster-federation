job "${ datacenter }-svc" {
  datacenters = ["${ datacenter }"]

  group "ml" {
    network {
      mode = "bridge"
      mbits = 1
    }

    service {
      name = "${ datacenter }-ml"
      port = 9090
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

    task "ml" {
      driver = "docker"

      config {
        image = "nicholasjackson/fake-service:v0.7.8"
      }
      env {
        MESSAGE = "hello from ml in DC ${ datacenter }"
      }

      resources {
        cpu    = 100
        memory = 100
      }
    }
  }
}
