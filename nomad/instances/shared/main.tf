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
  ip = "172.16.2.11"
}
