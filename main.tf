resource "oci_kms_key" "this" {
  for_each       = local.potential_resource
  compartment_id = each.value.compartment_id
  display_name   = "${each.value.display_name}-key"
  key_shape {
    algorithm = each.value.key_shape.algorithm
    length    = each.value.key_shape.length
    curve_id  = each.value.key_shape.curve_id
  }
  protection_mode     = each.value.protection_mode
  management_endpoint = each.value.management_endpoint
  defined_tags        = each.value.defined_tags
  freeform_tags       = each.value.freeform_tags
}
