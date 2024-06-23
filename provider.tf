provider "oci" {
    auth = "InstancePrincipal"
    region = var.region
}

variable "region" {}
variable "tenancy_id" {}
variable "namespace" {
  default = ""
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_id
}

output "ads" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}

terraform {
  backend "s3" {}
}