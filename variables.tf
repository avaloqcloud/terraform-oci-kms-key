variable "key" {
  description = "Key input object"
  type = object({
    # Required
    compartment_id      = string,
    display_name        = string,
    management_endpoint = string, # comes from vault object
    # Optional
    key_shape = optional(object({
      algorithm = string,
      length    = number,
      curve_id  = optional(string),
    })),
    protection_mode = optional(string),
    defined_tags    = optional(map(string)),
    freeform_tags   = optional(map(string)),
  })
}