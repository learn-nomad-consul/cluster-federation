job "${ datacenter }-web" {
  datacenters = ["${ datacenter }"]

  group "web" {
    network {
      mode = "bridge"
      mbits = 1
      port "http" {
        static = 8080
        to = 9090
      }
    }

    service {
      connect {
        sidecar_service {
          proxy {
            upstreams {
              destination_name = "${datacenter}-backend"
              local_bind_port = 12345
            }
            upstreams {
              destination_name = "shared-ml"
              local_bind_port = 23456
            }
          }
        }
        sidecar_task {
          resources {
            cpu = 50
            memory = 30
          }
        }
      }
    }

    task "web" {
      driver = "docker"

      config {
        image = "nicholasjackson/fake-service:v0.7.8"
      }
      resources {
        cpu    = 100
        memory = 100
      }
      env {
        UPSTREAM_URIS = "http://127.0.0.1:12345, http://127.0.0.1:12345/v2, http://127.0.0.1:23456",
        HTTP_CLIENT_APPEND_REQUEST = "true",
        LOG_LEVEL = "DEBUG"
        MESSAGE = "hello from web in DC ${ datacenter }"
      }
    }
  }
}
