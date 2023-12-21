resource "oci_kms_key" "this" {
  #Required
  compartment_id = var.key.compartment_id
  display_name   = var.key.display_name
  key_shape {
    #Required
    algorithm = var.key.key_shape.algorithm
    length    = var.key.key_shape.length

    #Optional
    curve_id = try(var.key.key_shape.curve_id, null)
  }
  management_endpoint = var.key.management_endpoint # from Vault object
  #Optional
  defined_tags    = var.key.defined_tags
  freeform_tags   = var.key.freeform_tags
  protection_mode = var.key.protection_mode
  /*

    Not managed yet

  dynamic "external_key_reference" {
    for_each = (each.value.external_key_reference != null) ? each.value.external_key_reference : {}
    content {
      #Required
      external_key_id = each.value.external_key_reference.external_key_id
    }
  }
  */
}