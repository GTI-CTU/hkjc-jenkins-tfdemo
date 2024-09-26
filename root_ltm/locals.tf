#########################################################################################
#------------------------- Tenant - Hong Kong Jockey Club (SAT) ------------------------#
#----------------------------- Subscription - hkjc-sat-gtm -----------------------------#
#########################################################################################

locals {
  PROJ = "itosgtm"
  ENV  = "sat1"
  subscription_id = "2df5f229-69e6-47bc-b4f3-197ac5bdfa4b"
  tags = {
    "hkjc:environment"    = "sat1"
    "hkjc:system-code"    = "NET.DNS"
    "hkjc:workload-owner" = "itos-network"
  }
}