## Key
data "oci_kms_keys" "existing_key" {
  # Required
  compartment_id      = var.key.compartment_id
  management_endpoint = var.key.management_endpoint

  # Filter
  filter {
    name   = "display_name"
    values = ["${var.key.display_name}"]
  }
  filter {
    # check if enabled
    name   = "state"
    values = ["ENABLED"]
  }
}