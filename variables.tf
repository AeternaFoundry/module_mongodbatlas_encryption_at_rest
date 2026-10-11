variable "encryption_at_rests" {
  description = <<EOT
Map of encryption_at_rests, attributes below
Required:
    - project_id
Optional:
    - enabled_for_search_nodes
    - aws_kms_config (block):
        - access_key_id (optional)
        - customer_master_key_id (optional)
        - enabled (optional)
        - region (optional)
        - require_private_networking (optional)
        - role_id (optional)
        - secret_access_key (optional)
    - azure_key_vault_config (block):
        - azure_environment (optional)
        - client_id (optional)
        - enabled (optional)
        - key_identifier (optional)
        - key_vault_name (optional)
        - require_private_networking (optional)
        - resource_group_name (optional)
        - role_id (optional)
        - secret (optional)
        - subscription_id (optional)
        - tenant_id (optional)
    - google_cloud_kms_config (block):
        - enabled (optional)
        - key_version_resource_id (optional)
        - role_id (optional)
        - service_account_key (optional)
EOT

  type = map(object({
    project_id               = string
    enabled_for_search_nodes = optional(bool)
    aws_kms_config = optional(list(object({
      access_key_id              = optional(string)
      customer_master_key_id     = optional(string)
      enabled                    = optional(bool)
      region                     = optional(string)
      require_private_networking = optional(bool)
      role_id                    = optional(string)
      secret_access_key          = optional(string)
    })))
    azure_key_vault_config = optional(list(object({
      azure_environment          = optional(string)
      client_id                  = optional(string)
      enabled                    = optional(bool)
      key_identifier             = optional(string)
      key_vault_name             = optional(string)
      require_private_networking = optional(bool)
      resource_group_name        = optional(string)
      role_id                    = optional(string)
      secret                     = optional(string)
      subscription_id            = optional(string)
      tenant_id                  = optional(string)
    })))
    google_cloud_kms_config = optional(list(object({
      enabled                 = optional(bool)
      key_version_resource_id = optional(string)
      role_id                 = optional(string)
      service_account_key     = optional(string)
    })))
  }))
}

