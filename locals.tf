locals {
  # Potential resources
  ## Key
  potential_key = length(data.oci_kms_keys.existing_key.keys) < 1 ? {
    "resource" = {
      # Required
      compartment_id      = var.key.compartment_id
      display_name        = var.key.display_name
      management_endpoint = var.key.management_endpoint
      key_shape           = var.key.key_shape
      # Optional
      protection_mode = var.key.protection_mode
      defined_tags    = var.key.defined_tags
      freeform_tags   = var.key.freeform_tags
    }
  } : {}

  # Outputs
  prep_existing_key_output = length(data.oci_kms_keys.existing_key.keys) > 0 ? {
    "resource" = {
      compartment_id                 = data.oci_kms_keys.existing_key.keys[0].compartment_id
      current_key_version            = data.oci_kms_keys.existing_key.keys[0].current_key_version
      defined_tags                   = data.oci_kms_keys.existing_key.keys[0].defined_tags
      desired_state                  = data.oci_kms_keys.existing_key.keys[0].desired_state
      display_name                   = data.oci_kms_keys.existing_key.keys[0].display_name
      external_key_reference         = data.oci_kms_keys.existing_key.keys[0].external_key_reference
      external_key_reference_details = data.oci_kms_keys.existing_key.keys[0].external_key_reference_details
      freeform_tags                  = data.oci_kms_keys.existing_key.keys[0].freeform_tags
      id                             = data.oci_kms_keys.existing_key.keys[0].id
      is_primary                     = data.oci_kms_keys.existing_key.keys[0].is_primary
      key_shape                      = data.oci_kms_keys.existing_key.keys[0].key_shape
      management_endpoint            = data.oci_kms_keys.existing_key.keys[0].management_endpoint
      protection_mode                = data.oci_kms_keys.existing_key.keys[0].protection_mode
      replica_details                = data.oci_kms_keys.existing_key.keys[0].replica_details
      restore_from_file              = data.oci_kms_keys.existing_key.keys[0].restore_from_file
      restore_from_object_store      = data.oci_kms_keys.existing_key.keys[0].restore_from_object_store
      restore_trigger                = data.oci_kms_keys.existing_key.keys[0].restore_trigger
      restored_from_key_id           = data.oci_kms_keys.existing_key.keys[0].restored_from_key_id
      state                          = data.oci_kms_keys.existing_key.keys[0].state
      time_created                   = data.oci_kms_keys.existing_key.keys[0].time_created
      time_of_deletion               = data.oci_kms_keys.existing_key.keys[0].time_of_deletion
      vault_id                       = data.oci_kms_keys.existing_key.keys[0].vault_id
    }
  } : {}
  output_key = merge(oci_kms_key.this, local.prep_existing_key_output)
}