resource "nexus_repository_nuget_proxy" "nuget_proxy" {
  name   = "nuget-proxy"
  online = true

  nuget_version            = "V3"
  query_cache_item_max_age = 3600

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
  }

  proxy {
    remote_url       = "https://api.nuget.org/v3/index.json"
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

resource "nexus_repository_nuget_hosted" "nuget_hosted" {
  name   = "nuget-hosted"
  online = true

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}

resource "nexus_repository_nuget_group" "nuget" {
  name   = "nuget"
  online = true

  group {
    member_names = [
      nexus_repository_nuget_hosted.nuget_hosted.name,
      nexus_repository_nuget_proxy.nuget_proxy.name,
    ]
  }

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
  }
}
