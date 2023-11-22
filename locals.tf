locals {
  # In case the expected resource does not exist yet
  potential_resource = length(data.oci_kms_key.existing_resource) < 1 ? var.key != null ? {
    for flat_key in flatten([
      for k, v in var.key : {
        key_id              = null
        k                   = k
        compartment_id      = v.compartment_id
        display_name        = v.display_name
        key_shape           = v.key_shape
        protection_mode     = v.protection_mode
        management_endpoint = v.management_endpoint
        defined_tags        = v.defined_tags
        freeform_tags       = v.freeform_tags
      }
    ]) : flat_key.k => flat_key
  } : {} : {}
  # Either return newly created resource or existing resource based on key_id and management_endpoint
  output = merge(oci_kms_key.this, data.oci_kms_key.existing_resource)
}