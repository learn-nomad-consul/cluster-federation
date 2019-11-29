job "${ datacenter }-svc2" {
  datacenters = ["${ datacenter }"]

  group "svc2" {
    network {
      mode = "bridge"
    }

    service {
      name = "${ datacenter }-svc2"
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

    task "svc2" {
      driver = "docker"

      config {
        image = "nicholasjackson/fake-service:v0.7.8"
      }

      env {
        MESSAGE = "hello from svc2 in DC ${ datacenter }"
      }

      resources {
        cpu    = 100
        memory = 100
      }
    }
  }
}
