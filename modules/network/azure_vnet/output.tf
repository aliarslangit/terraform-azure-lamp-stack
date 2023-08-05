output "subnet_ids" {
  value = {
    for subnet_name, subnet in azurerm_subnet.subnets : subnet_name => subnet.id
  }
}

output "vnet_id" {
  description = "ID of Vnet"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "name of Vnet"
  value       = azurerm_virtual_network.vnet.name
}