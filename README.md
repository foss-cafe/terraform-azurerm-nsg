# Terraform module for Azure Network Security Group

## How to use it as a module

```hcl
module "nsg" {
  source  = "foss-cafe/nsg/azurerm"
  version = "1.0.1"
  name                = "terraform-test-nsg"
  location            = "East US"
  resource_group_name = "terraform-test"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_subnet_network_security_group_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_nsg"></a> [associate\_nsg](#input\_associate\_nsg) | (Optional) Do you want to associate nsg with subnet | `bool` | `false` | no |
| <a name="input_create_nsg"></a> [create\_nsg](#input\_create\_nsg) | (Optional) Do you want ot create Network secuirty group | `bool` | `true` | no |
| <a name="input_custom_nsg_rules"></a> [custom\_nsg\_rules](#input\_custom\_nsg\_rules) | (Optional) Any Custom NSG rules you want to add | `any` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) Specifies the name of the network security group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created. | `string` | `"type"` | no |
| <a name="input_security_rule"></a> [security\_rule](#input\_security\_rule) | (Optional) List of objects representing security rules | `any` | <pre>[<br>  {<br>    "access": "Allow",<br>    "description": "Outbound 443",<br>    "destination_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "destination_port_ranges": [<br>      443<br>    ],<br>    "direction": "Outbound",<br>    "name": "outbound-443",<br>    "priority": "100",<br>    "protocol": "Tcp",<br>    "source_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "source_port_ranges": [<br>      443<br>    ]<br>  },<br>  {<br>    "access": "Allow",<br>    "description": "Outbound 80",<br>    "destination_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "destination_port_ranges": [<br>      80<br>    ],<br>    "direction": "Outbound",<br>    "name": "outbound-80",<br>    "priority": "101",<br>    "protocol": "Tcp",<br>    "source_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "source_port_ranges": [<br>      80<br>    ]<br>  },<br>  {<br>    "access": "Allow",<br>    "description": "Outbound 53",<br>    "destination_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "destination_port_ranges": [<br>      53<br>    ],<br>    "direction": "Outbound",<br>    "name": "outbound-53",<br>    "priority": "102",<br>    "protocol": "Udp",<br>    "source_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "source_port_ranges": [<br>      53<br>    ]<br>  },<br>  {<br>    "access": "Allow",<br>    "description": "Inbound 443",<br>    "destination_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "destination_port_ranges": [<br>      443<br>    ],<br>    "direction": "Inbound",<br>    "name": "inbound-443",<br>    "priority": "100",<br>    "protocol": "Tcp",<br>    "source_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "source_port_ranges": [<br>      443<br>    ]<br>  },<br>  {<br>    "access": "Allow",<br>    "description": "Inbound 80",<br>    "destination_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "destination_port_ranges": [<br>      80<br>    ],<br>    "direction": "Inbound",<br>    "name": "inbound-80",<br>    "priority": "101",<br>    "protocol": "Tcp",<br>    "source_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "source_port_ranges": [<br>      80<br>    ]<br>  },<br>  {<br>    "access": "Allow",<br>    "description": "Inbound 53",<br>    "destination_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "destination_port_ranges": [<br>      53<br>    ],<br>    "direction": "Inbound",<br>    "name": "inbound-53",<br>    "priority": "102",<br>    "protocol": "Udp",<br>    "source_address_prefixes": [<br>      "0.0.0.0/0"<br>    ],<br>    "source_port_ranges": [<br>      53<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | (Optional) The ID of the Subnet. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
