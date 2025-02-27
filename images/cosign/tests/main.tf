terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "${path.module}/01-help.sh"
}

module "sigstore-scaffolding" {
  source     = "../../sigstore-scaffolding/tests"
  cosign-cli = var.digest
}
