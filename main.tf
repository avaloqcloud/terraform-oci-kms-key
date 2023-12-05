resource "oci_kms_key" "this" {
  for_each = local.potential_key
  #Required
  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  key_shape {
    #Required
    algorithm = each.value.key_shape.algorithm
    length    = each.value.key_shape.length

    #Optional
    curve_id = each.value.key_shape.curve_id
  }
  management_endpoint = each.value.management_endpoint
  #Optional
  defined_tags    = each.value.defined_tags
  freeform_tags   = each.value.freeform_tags
  protection_mode = each.value.protection_mode
  /*
  Unhandled Parameters:
  external_key_reference {
      #Required
      external_key_id = oci_kms_key.test_key.id
  }
  */
}