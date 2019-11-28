variable "datacenter" {}
variable "ip" {}
variable "local_ip" {}

data "template_file" "main" {
  template = file("${path.module}/template.hcl")
  vars = {
    datacenter = var.datacenter
    local_ip = var.local_ip
    ip = var.ip
  }
}

resource "nomad_job" "shared" {
  jobspec = data.template_file.main.rendered
}
