resource "azurerm_network_security_group" "this" {
  count = var.create_nsg ? 1 : 0

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.security_rule

    content {
      name                                       = try(security_rule.value.name)
      description                                = try(security_rule.value.description, null)
      protocol                                   = try(security_rule.value.protocol)
      source_port_ranges                         = try(security_rule.value.source_port_ranges, [])
      destination_port_ranges                    = try(security_rule.value.destination_port_ranges, [])
      source_address_prefix                      = try(security_rule.value.source_address_prefix, null)
      source_address_prefixes                    = try(security_rule.value.source_address_prefixes, [])
      source_application_security_group_ids      = try(security_rule.value.source_application_security_group_ids, [])
      destination_address_prefix                 = try(security_rule.value.destination_address_prefix, null)
      destination_address_prefixes               = try(security_rule.value.destination_address_prefixes, [])
      destination_application_security_group_ids = try(security_rule.value.destination_application_security_group_ids, [])
      access                                     = try(security_rule.value.access, "Deny")
      priority                                   = try(security_rule.value.priority, "100")
      direction                                  = try(security_rule.value.direction, "Outbound")
    }
  }

  tags = var.tags
}


resource "azurerm_network_security_rule" "this" {
  for_each = var.custom_nsg_rules

  name                                       = each.key
  resource_group_name                        = var.resource_group_name
  network_security_group_name                = azurerm_network_security_group.this[0].id
  description                                = try(each.value.description, null)
  protocol                                   = each.value.protocol
  source_port_range                          = try(each.value.source_port_range, null)
  source_port_ranges                         = try(each.value.source_port_ranges, null)
  destination_port_range                     = try(each.value.destination_port_range, null)
  destination_port_ranges                    = try(each.value.destination_port_ranges, null)
  source_address_prefix                      = try(each.value.source_address_prefix, null)
  source_address_prefixes                    = try(each.value.source_address_prefixes, null)
  source_application_security_group_ids      = try(each.value.source_application_security_group_ids, null)
  destination_address_prefix                 = try(each.value.destination_address_prefix, null)
  destination_address_prefixes               = try(each.value.destination_address_prefixes, null)
  destination_application_security_group_ids = try(each.value.destination_application_security_group_ids, null)
  access                                     = each.value.access
  priority                                   = each.value.priority
  direction                                  = each.value.direction
}


resource "azurerm_subnet_network_security_group_association" "this" {
  count = var.associate_nsg ? 1 : 0

  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.this[0].id
}
