data "oci_kms_key" "existing_resource" {
  for_each = {
    for k, v in var.key : k => v
    if v.key_id != null
  }
  key_id              = each.value.key_id
  management_endpoint = each.value.management_endpoint
}