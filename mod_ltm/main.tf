#########################################################################################
#------------------------- Tenant - Hong Kong Jockey Club (SAT) ------------------------#
#----------------------------- Subscription - hkjc-sat-gtm -----------------------------#
#########################################################################################

# Tenant ID
  data "azurerm_client_config" "current" {}

  data "azurerm_subscription" "primary" {}

#########################################################################################
#--------------------------------- Main Configuration ----------------------------------#
#########################################################################################

# Resource Group
  resource "azurerm_resource_group" "rg" {
    name                   = "rg-${local.PROJ}-${local.ENV}-${format("%03d", 1)}"
    location               = "East Asia"
    tags                   = local.tags
  }

# Virtual Network
  resource "azurerm_virtual_network" "vnet" {
    name                   = "vnet-${local.PROJ}-${local.ENV}-${format("%03d", 1)}"
    resource_group_name    = azurerm_resource_group.rg.name
    location               = azurerm_resource_group.rg.location
    address_space          = ["100.65.128.0/21"]
    tags                   = local.tags
  }
  # Subnet
    resource "azurerm_subnet" "snet_ltm" {
      count                = 4
      name                 = "snet-${local.PROJ}-${local.ENV}-public-${format("%03d", count.index + 1)}"
      resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
      virtual_network_name = azurerm_virtual_network.vnet.name
      address_prefixes     = ["100.65.${format("%03d", count.index + 128)}.0/24"]
    }

# Public IP
  resource "azurerm_public_ip" "pip" {
    count                  = 4
    name                   = "pip-${local.PROJ}-${local.ENV}-${format("%03d", count.index +1)}"
    resource_group_name    = azurerm_resource_group.rg.name
    location               = azurerm_resource_group.rg.location
    allocation_method      = "Static"
    zones                  = ["1","2","3"]
    sku                    = "Standard"
    #ddos_protection_mode   = "Enabled"
    #ddos_protection_plan_id = azurerm_network_ddos_protection_plan.ddos_protection_plan.id
    tags                   = local.tags
  }
