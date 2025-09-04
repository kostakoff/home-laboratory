resource "nexus_repository_raw_proxy" "github" {
  name   = "github"
  online = true

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = false
  }

  proxy {
    remote_url       = "https://github.com/"
    content_max_age  = 1440
    metadata_max_age = 1440
  }

  negative_cache {
    enabled = true
    ttl     = 1440
  }

  http_client {
    blocked    = false
    auto_block = true
    connection {
      enable_circular_redirects = true
    }
  }
}
