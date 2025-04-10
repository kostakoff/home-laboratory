variable "nexus_url" {
  default = "http://nexus.local"
  ephemeral = true
}

variable "admin_user" {
  default = "admin"
  ephemeral = true
}

variable "admin_password" {
  default = "admin"
  ephemeral = true
}

variable "blobstore" {
  default = "default"
}
