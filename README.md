[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/avaloqcloud/terraform-oci-kms-key/archive/refs/heads/main.zip)
# Terraform OCI KMS Key
The code provides a reusable Terraform module that provisions a KMS Key on Oracle Cloud Infrastructure.

## Example Input
`key.auto.tfvars.json`:
```json
{
    "key": {
        "resource": {
            "key_id": "ocid1.key.oc1.eu-frankfurt-1.x",
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
| [oci_kms_key.existing_resource](https://registry.terraform.io/providers/oracle/oci/5.18.0/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fingerprint"></a> [fingerprint](#input\_fingerprint) | n/a | `any` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | Key input object | <pre>map(object({<br>    key_id         = optional(string), # Required for lookup<br>    compartment_id = optional(string),<br>    display_name   = optional(string),<br>    key_shape = optional(object({<br>      algorithm = string,<br>      length    = number,<br>      curve_id  = optional(string),<br>    })),<br>    protection_mode = optional(string),<br>    #vault_id = optional(string), # potentially we look up the management_endpoint based on the vault_id<br>    management_endpoint = optional(string), # Required for lookup<br>    defined_tags        = optional(map(string)),<br>    freeform_tags       = optional(map(string)),<br>  }))</pre> | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_tenancy_ocid"></a> [tenancy\_ocid](#input\_tenancy\_ocid) | n/a | `any` | n/a | yes |
| <a name="input_user_ocid"></a> [user\_ocid](#input\_user\_ocid) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key"></a> [key](#output\_key) | n/a |
<!-- END_TF_DOCS -->
