[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/avaloqcloud/terraform-oci-kms-key/archive/refs/heads/main.zip)
# Terraform OCI KMS Key
The code provides a reusable and standalone Terraform module that provisions a KMS Key on Oracle Cloud Infrastructure.

## Example Input
`key.auto.tfvars.json`:
```json
{
  "key": {
    "compartment_id": "ocid1.tenancy.oc1..x",
    "display_name": "my-key",
    "protection_mode": "HSM",
    "management_endpoint": "https://x-management.kms.eu-frankfurt-1.oraclecloud.com",
    "key_shape": {
        "algorithm": "AES",
        "length": 32
    }
  }
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.9 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 5.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 5.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_kms_key.this](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key"></a> [key](#input\_key) | Key input object | <pre>object({<br>    # Required<br>    compartment_id      = string,<br>    display_name        = string,<br>    management_endpoint = string, # comes from Vault object<br>    key_shape = object({<br>      algorithm = string,<br>      length    = number,<br>      curve_id  = optional(string),<br>    }),<br>    # Optional<br>    protection_mode = optional(string),<br>    defined_tags    = optional(map(string)),<br>    freeform_tags   = optional(map(string)),<br>    /*<br><br>      Not managed yet<br><br>    external_key_reference = optional(object({<br>      external_key_id = string,<br>    }))<br>    */<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key"></a> [key](#output\_key) | Key output object |
<!-- END_TF_DOCS -->
