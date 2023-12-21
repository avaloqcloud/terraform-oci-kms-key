variable "key" {
  description = "Key input object"
  type = object({
    # Required
    compartment_id      = string,
    display_name        = string,
    management_endpoint = string, # comes from Vault object
    key_shape = object({
      algorithm = string,
      length    = number,
      curve_id  = optional(string),
    }),
    # Optional
    protection_mode = optional(string),
    defined_tags    = optional(map(string)),
    freeform_tags   = optional(map(string)),
    /*

      Not managed yet

    external_key_reference = optional(object({
      external_key_id = string,
    }))
    */
  })
  # Validation
  ## protection_mode (if given)
  validation {
    condition     = var.key.protection_mode != null ? (contains(["HSM", "SOFTWARE", /* Not yet supported: "EXTERNAL"*/], var.key.protection_mode)) : true
    error_message = "Validation of the Key object failed. 'protection_mode' must be one of 'HSM', 'SOFTWARE'."
  }
  ## key_shape
  ### algorithm
  validation {
    condition     = contains(["AES", "RSA", "ECDSA"], var.key.key_shape.algorithm)
    error_message = "Validation of the Key object failed. 'key_shape.algorithm' must be one of 'AES', 'RSA', 'ECDSA'."
  }
  ### length
  #### if algorithm AES length must be 16, 24, 32
  validation {
    condition     = var.key.key_shape.algorithm == "AES" ? (var.key.key_shape.length == 16 || var.key.key_shape.length == 24 || var.key.key_shape.length == 32 ? true : false) : true
    error_message = "Validation of the Key object failed. 'key_shape.algorithm' is 'AES', 'key_shape.length' must be one of 16, 24, 32."
  }
  #### if algorithm RSA length must be 256, 384, 512
  validation {
    condition     = var.key.key_shape.algorithm == "RSA" ? (var.key.key_shape.length == 256 || var.key.key_shape.length == 384 || var.key.key_shape.length == 512 ? true : false) : true
    error_message = "Validation of the Key object failed. 'key_shape.algorithm' is 'RSA', 'key_shape.length' must be one of 256, 384, 512."
  }
  #### if algorithm ECDSA length must be 32, 48, 66
  validation {
    condition     = var.key.key_shape.algorithm == "ECDSA" ? (var.key.key_shape.length == 32 || var.key.key_shape.length == 48 || var.key.key_shape.length == 66 ? true : false) : true
    error_message = "Validation of the Key object failed. 'key_shape.algorithm' is 'ECDSA', 'key_shape.length' must be one of 32, 48, 66."
  }
}