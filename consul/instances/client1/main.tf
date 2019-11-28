provider "consul" {
  address    = "localhost:8500"
  datacenter = "client1"
  version = "~> 2.6"
}

module "client" {
  source = "../../modules/clientv1"
}
