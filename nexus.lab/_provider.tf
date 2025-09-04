terraform {
  required_providers {
    nexus = {
      source = "datadrivers/nexus"
      version = "2.5.0"
    }
  }
}

provider "nexus" {
  url      = var.nexus_url
  insecure = true
  password = var.admin_password
  username = var.admin_user
}
