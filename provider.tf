#########################################################################################
#------------------------- Tenant - Hong Kong Jockey Club (SAT) ------------------------#
#----------------------------- Subscription - hkjc-sat-gtm -----------------------------#
#########################################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.2.0"
    }
  }
}

provider "azurerm" {
  features {}
    subscription_id = "2df5f229-69e6-47bc-b4f3-197ac5bdfa4b"     
}

