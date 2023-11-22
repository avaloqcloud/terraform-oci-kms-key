variable "user_ocid" {}
variable "fingerprint" {}
variable "tenancy_ocid" {}
variable "region" {}
variable "private_key_path" {}
variable "key" {
  description = "Key input object"
  type = map(object({
    key_id         = optional(string), # Required for lookup
    compartment_id = optional(string),
    display_name   = optional(string),
    key_shape = optional(object({
      algorithm = string,
      length    = number,
      curve_id  = optional(string),
    })),
    protection_mode = optional(string),
    #vault_id = optional(string), # potentially we look up the management_endpoint based on the vault_id
    management_endpoint = optional(string), # Required for lookup
    defined_tags        = optional(map(string)),
    freeform_tags       = optional(map(string)),
  }))
  validation {
    condition = alltrue([
      for k, v in var.key : contains(["HSM", "SOFTWARE"], v.protection_mode)
    ])
    error_message = "Validation of the Key object failed. 'protection_mode' must be one of 'HSM' or 'SOFTWARE'"
  }
}