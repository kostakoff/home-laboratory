resource "nexus_repository_nuget_proxy" "psgallery_proxy" {
  name   = "psgallery-proxy"
  online = true

  nuget_version            = "V2"
  query_cache_item_max_age = 3600

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
  }

  proxy {
    remote_url       = "https://www.powershellgallery.com/api/v2"
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
  }
}

resource "nexus_repository_nuget_hosted" "psgallery_hosted" {
  name   = "psgallery-hosted"
  online = true

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}

resource "nexus_repository_nuget_group" "psgallery" {
  name   = "psgallery"
  online = true

  group {
    member_names = [
      nexus_repository_nuget_hosted.psgallery_hosted.name,
      nexus_repository_nuget_proxy.psgallery_proxy.name,
    ]
  }

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
  }
}
