terraform {
  required_version = ">= 1.6.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "project-89e0e80c-de2d-4887-90c"
  region  = "us-central1"
  zone    = "us-central1-a"
}

module "gcp_infrastructure" {
  source = "git::https://github.com/cliffbill/terraform-modules.git//gcp/network?ref=v2.0.1"

  vpc_name    = "prod-gcp-lab-vpc"
  subnet_name = "prod-gcp-lab-subnet"
  subnet_cidr = "10.30.0.0/24"
  region      = "us-central1"
}
