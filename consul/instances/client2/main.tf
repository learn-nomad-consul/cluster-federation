provider "consul" {
  address    = "localhost:8500"
  datacenter = "client2"
  version = "~> 2.6"
}

module "client" {
  source = "../../modules/clientv2"
  dc = "client2"
}
