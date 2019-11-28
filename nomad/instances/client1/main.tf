provider "nomad" {
  address = "http://localhost:4646"
  version = "~> 1.4"
}

module "mesh-gateway" {
  source = "../../modules/gateway"
  datacenter = "client1"
  local_ip = "172.16.3.11"
  ip = "172.18.3.11"
}

module "web" {
  source = "../../modules/web"
  datacenter = "client1"
}

module "svc1" {
  source = "../../modules/svc1"
  datacenter = "client1"
}
