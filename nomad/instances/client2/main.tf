provider "nomad" {
  address = "http://localhost:4646"
  version = "~> 1.4"
}

module "web" {
  source = "../../modules/web"
  datacenter = "client2"
}

module "svc1" {
  source = "../../modules/svc1"
  datacenter = "client2"
}

module "svc2" {
  source = "../../modules/svc2"
  datacenter = "client2"
}
