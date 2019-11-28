provider "consul" {
  address    = "localhost:8500"
  datacenter = "shared"
  version = "~> 2.6"
}

module "shared" {
  source = "../../modules/shared"
}
