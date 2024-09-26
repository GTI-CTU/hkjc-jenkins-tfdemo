#########################################################################################
#------------------------- Tenant - Hong Kong Jockey Club (SAT) ------------------------#
#----------------------------- Subscription - hkjc-sat-gtm -----------------------------#
#########################################################################################



# Application Gateway (LTM) - ST
  # Listeners - HTTPS
    ltm_st_https_listeners                    = {
      listenerSTMcjctxn    = { port = "443",  host_names = [ "Mcjctxn.qcew.com"   ], ssl_cert_name = "ssl-cert-test001" }
      listenerSTiosbstxn   = { port = "443",  host_names = [ "iosbstxn.qcew.com"  ], ssl_cert_name = "ssl-cert-test002" }
      listenerSTiosbsinfo  = { port = "443",  host_names = [ "iosbsinfo.qcew.com" ], ssl_cert_name = "ssl-cert-test003" }
      listenerSTelogin     = { port = "443",  host_names = [ "Elogin.qcew.com"    ], ssl_cert_name = "ssl-cert-test004" }
      listenerSTelogin8443 = { port = "8443", host_names = [ "Elogin.qcew.com"    ], ssl_cert_name = "ssl-cert-test005" }
    }
  # Redirect Configurations
    ltm_st_redirect_configs                   = {
      redirectSTMcjctxn    = { target_url = "https://mmxjctxn02.qcew.com"  }
      redirectSTiosbstxn   = { target_url = "https://iosbstxn02.qcew.com"  }
      redirectSTiosbsinfo  = { target_url = "https://iosbsinfo02.qcew.com" }
      redirectSTelogin     = { target_url = "https://elogin02.qcew.com"    }
      redirectSTelogin8443 = { target_url = "https://elogin02.qcew.com"    }             
    }
  # Rewrite Sets
    ltm_st_rewrite_set_rules                  = {
      NewRewrite = { rule_sequence = 100, header_name = "Strict-Transport-Security", header_value = "max-age=31536000; includeSubDomains" }
    }
  # Routing Rules
    ltm_st_routing_rules                      = {
      ruleSTMcjctxn    = { priority = 1,  listener_name = "listenerSTMcjctxn",    redirect_config_name = "redirectSTMcjctxn"    }
      ruleSTiosbstxn   = { priority = 2,  listener_name = "listenerSTiosbstxn",   redirect_config_name = "redirectSTiosbstxn"   }
      ruleSTiosbsinfo  = { priority = 3,  listener_name = "listenerSTiosbsinfo",  redirect_config_name = "redirectSTiosbsinfo"  }
      ruleSTelogin     = { priority = 5,  listener_name = "listenerSTelogin",     redirect_config_name = "redirectSTelogin"     }
      ruleSTelogin8443 = { priority = 10, listener_name = "listenerSTelogin8443", redirect_config_name = "redirectSTelogin8443" }
    }


# Application Gateway (LTM) - HV
  # Listeners - HTTPS
    ltm_hv_https_listeners                    = {
      listenerHVMcjctxn    = { port = "443",  host_names = [ "Mcjctxn.qcew.com"   ], ssl_cert_name = "ssl-cert-test001" }
      listenerHViosbstxn   = { port = "443",  host_names = [ "iosbstxn.qcew.com"  ], ssl_cert_name = "ssl-cert-test002" }
      listenerHViosbsinfo  = { port = "443",  host_names = [ "iosbsinfo.qcew.com" ], ssl_cert_name = "ssl-cert-test003" }
      listenerHVelogin     = { port = "443",  host_names = [ "Elogin.qcew.com"    ], ssl_cert_name = "ssl-cert-test004" }
      listenerHVelogin8443 = { port = "8443", host_names = [ "Elogin.qcew.com"    ], ssl_cert_name = "ssl-cert-test005" }
    }
  # Redirect Configurations
    ltm_hv_redirect_configs                   = {
      redirectHVMcjctxn    = { target_url = "https://mmxjctxn02.qcew.com"  }
      redirectHViosbstxn   = { target_url = "https://iosbstxn02.qcew.com"  }
      redirectHViosbsinfo  = { target_url = "https://iosbsinfo02.qcew.com" }
      redirectHVelogin     = { target_url = "https://elogin02.qcew.com"    }
      redirectHVelogin8443 = { target_url = "https://elogin02.qcew.com"    } 
    }
  # Rewrite Sets
    ltm_hv_rewrite_set_rules                  = {
      NewRewrite = { rule_sequence = 100, header_name = "Strict-Transport-Security", header_value = "max-age=31536000; includeSubDomains" }
    }
  # Routing Rules
    ltm_hv_routing_rules                      = {
      ruleHVMcjctxn    = { priority = 1,  listener_name = "listenerHVMcjctxn",    redirect_config_name = "redirectHVMcjctxn"    }    
      ruleHViosbstxn   = { priority = 2,  listener_name = "listenerHViosbstxn",   redirect_config_name = "redirectHViosbstxn"   }
      ruleHViosbsinfo  = { priority = 3,  listener_name = "listenerHViosbsinfo",  redirect_config_name = "redirectHViosbsinfo"  }
      ruleHVelogin     = { priority = 5,  listener_name = "listenerHVelogin",     redirect_config_name = "redirectHVelogin"     }
      ruleHVelogin8443 = { priority = 10, listener_name = "listenerHVelogin8443", redirect_config_name = "redirectHVelogin8443" }
    }


  # SSL Certificates
    ltm_ssl_certificates   = [ "ssl-cert-test001" , "ssl-cert-test002", "ssl-cert-test003", "ssl-cert-test004", "ssl-cert-test005" ]

