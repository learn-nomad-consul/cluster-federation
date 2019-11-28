job "${ datacenter }-gateway" {
  datacenters = ["${ datacenter }"]

  group "gateway" {
    network {
      mode = "host"
      mbits = 1
    }

    task "gateway" {
      driver = "docker"

      config {
        image = "nicholasjackson/consul-envoy:v1.6.1-v0.10.0"
        network_mode = "host"
        args = [
          "consul",
          "connect", "envoy",
          "-mesh-gateway",
          "-register",
          "-address", "${local_ip}:8443",
          "-wan-address", "${ip}:8443",
          "--",
          "-l", "debug"
        ]
      }

      env {
        CONSUL_HTTP_ADDR = "127.0.0.1:8500"
        CONSUL_GRPC_ADDR = "127.0.0.1:8502"
      }

      resources {
        cpu    = 100
        memory = 100
      }
    }
  }
}
