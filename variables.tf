variable "create_nsg" {
  type        = bool
  description = "(Optional) Do you want ot create Network secuirty group"
  default     = true
}

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
  default     = "type"
}

variable "security_rule" {
  type        = any
  description = "(Optional) List of objects representing security rules"
  default = [
    {
      name                         = "outbound-443"
      description                  = "Outbound 443"
      protocol                     = "Tcp"
      source_port_ranges           = [443]
      destination_port_ranges      = [443]
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
      access                       = "Allow"
      priority                     = "100"
      direction                    = "Outbound"
    },
    {
      name                         = "outbound-80"
      description                  = "Outbound 80"
      protocol                     = "Tcp"
      source_port_ranges           = [80]
      destination_port_ranges      = [80]
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
      access                       = "Allow"
      priority                     = "101"
      direction                    = "Outbound"
    },
    {
      name                         = "outbound-53"
      description                  = "Outbound 53"
      protocol                     = "Udp"
      source_port_ranges           = [53]
      destination_port_ranges      = [53]
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
      access                       = "Allow"
      priority                     = "102"
      direction                    = "Outbound"
    },
    {
      name                         = "inbound-443"
      description                  = "Inbound 443"
      protocol                     = "Tcp"
      source_port_ranges           = [443]
      destination_port_ranges      = [443]
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
      access                       = "Allow"
      priority                     = "100"
      direction                    = "Inbound"
    },
    {
      name                         = "inbound-80"
      description                  = "Inbound 80"
      protocol                     = "Tcp"
      source_port_ranges           = [80]
      destination_port_ranges      = [80]
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
      access                       = "Allow"
      priority                     = "101"
      direction                    = "Inbound"
    },
    {
      name                         = "inbound-53"
      description                  = "Inbound 53"
      protocol                     = "Udp"
      source_port_ranges           = [53]
      destination_port_ranges      = [53]
      source_address_prefixes      = ["0.0.0.0/0"]
      destination_address_prefixes = ["0.0.0.0/0"]
      access                       = "Allow"
      priority                     = "102"
      direction                    = "Inbound"
    }


  ]
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable "custom_nsg_rules" {
  type        = any
  description = "(Optional) Any Custom NSG rules you want to add"
  default     = {}
}

variable "associate_nsg" {
  type        = bool
  description = "(Optional) Do you want to associate nsg with subnet"
  default     = false
}

variable "subnet_id" {
  type        = string
  description = "(Optional) The ID of the Subnet. Changing this forces a new resource to be created."
  default     = null
}

