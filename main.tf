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
    curve_id = try(each.value.key_shape.curve_id, null)
  }
  management_endpoint = each.value.management_endpoint
  #Optional
  defined_tags    = each.value.defined_tags
  freeform_tags   = each.value.freeform_tags
  protection_mode = each.value.protection_mode
  dynamic "external_key_reference" {
    for_each = (each.value.external_key_reference != null) ? each.value.external_key_reference : {}
    content {
      #Required
      #external_key_id = external_key_reference.value.external_key_id
      external_key_id = each.value.external_key_reference.external_key_id
    }
  }
}