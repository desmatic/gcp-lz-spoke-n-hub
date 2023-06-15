output "development_folder_id" {
  description = "The spoke folder id"
  value       = module.spoke.spoke_folder_id
}

output "development_network_self_link" {
  description = "The spoke network id"
  value       = module.spoke.spoke_network_self_link
}
