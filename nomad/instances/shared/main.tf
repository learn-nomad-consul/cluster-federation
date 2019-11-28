provider "nomad" {
  address = "http://localhost:4646"
  version = "~> 1.4"
}

module "shared" {
  source = "../../modules/shared"
  datacenter = "shared"
}
module "mesh-gateway" {
  source = "../../modules/gateway"
  datacenter = "shared"
  local_ip = "172.16.2.11"
  ip = "172.18.2.11"
}
