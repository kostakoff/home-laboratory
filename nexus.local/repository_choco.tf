resource "nexus_repository_nuget_proxy" "chocolatey_proxy" {
  name   = "chocolatey-proxy"
  online = true

  nuget_version            = "V2"
  query_cache_item_max_age = 3600

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
  }

  proxy {
    remote_url       = "https://community.chocolatey.org/api/v2/"
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

resource "nexus_repository_nuget_hosted" "chocolatey_hosted" {
  name   = "chocolatey-hosted"
  online = true

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
    write_policy                   = "ALLOW"
  }
}

resource "nexus_repository_nuget_group" "chocolatey" {
  name   = "chocolatey"
  online = true

  group {
    member_names = [
      nexus_repository_nuget_hosted.chocolatey_hosted.name,
      nexus_repository_nuget_proxy.chocolatey_proxy.name,
    ]
  }

  storage {
    blob_store_name                = var.blobstore
    strict_content_type_validation = true
  }
}
