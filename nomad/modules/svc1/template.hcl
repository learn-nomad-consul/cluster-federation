job "${ datacenter }-svc1" {
  datacenters = ["${ datacenter }"]

  group "svc1" {
    network {
      mode = "bridge"
    }

    service {
      name = "${ datacenter }-svc1"
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

    task "svc1" {
      driver = "docker"

      config {
        image = "nicholasjackson/fake-service:v0.7.8"
      }
      env {
        MESSAGE = "hello from svc1 in DC ${ datacenter }"
      }

      resources {
        cpu    = 100
        memory = 100
      }
    }
  }
}
