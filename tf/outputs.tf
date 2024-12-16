output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "endpoint" {
  value = azurerm_kubernetes_cluster.aks.endpoint
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}