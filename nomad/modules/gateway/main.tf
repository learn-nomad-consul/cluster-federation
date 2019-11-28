variable "datacenter" {}
variable "ip" {}

data "template_file" "main" {
  template = file("${path.module}/template.hcl")
  vars = {
    datacenter = var.datacenter
    ip = var.ip
  }
}

resource "nomad_job" "shared" {
  jobspec = data.template_file.main.rendered
}
