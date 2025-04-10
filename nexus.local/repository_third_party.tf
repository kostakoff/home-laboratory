resource "nexus_repository_raw_hosted" "third_party" {
  name   = "third-party"
  online = true

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = false
    write_policy                   = "ALLOW"
  }
}
