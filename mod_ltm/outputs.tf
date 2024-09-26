#########################################################################################
#------------------------- Tenant - Hong Kong Jockey Club (SAT) ------------------------#
#----------------------------- Subscription - hkjc-sat-gtm -----------------------------#
#########################################################################################

output "pulbic_ip_id" {
  description = "All Public IP ids for DDoS Protection"
  value = module.ltm.azurerm_public_ip.pip[*].id
}

output "ltm_public_ip" {
  description = "Application Gateway Public IP Address"
  value = module.ltm.azurerm_public_ip.pip[*].id
}