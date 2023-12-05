output "key" {
  value       = local.output_key["resource"] # flatten using static map key
  description = "Key output object"
}