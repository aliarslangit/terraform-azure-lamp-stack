resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.rgname
}

resource "azurerm_subnet" "subnets" {
  for_each  = var.subnets
  name      = each.key
  address_prefixes = [each.value]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rgname
  service_endpoints    = ["Microsoft.Sql"]
}