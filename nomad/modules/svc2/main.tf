variable "datacenter" {}

data "template_file" "main" {
  template = file("${path.module}/template.hcl")
  vars = {
    datacenter = var.datacenter
  }
}

resource "nomad_job" "svc2" {
  jobspec = data.template_file.main.rendered
}
