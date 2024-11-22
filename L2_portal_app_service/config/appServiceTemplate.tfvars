appServiceTemplate = {
  template = {
    appServiceEnvironment = {
      resource_group = "portal_app_service"
      subnet         = "OZ2"

      # Optional: Uncomment to set any of those values from the defaults
      # allow_new_private_endpoint_connections = false
      # internal_load_balancing_mode           = "Web, Publishing"
      # dedicated_host_count                   = 2
      # remote_debugging_enabled               = false
      # zone_redundant                         = false

      # Optional: Uncomment these to set cluster settings. If you do, then the FrontEndSSLCipherSuiteOrder is required
      # cluster_setting = [
      #   {
      #     name  = "FrontEndSSLCipherSuiteOrder"
      #     value = "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
      #   },
      #   {
      #     name  = "DisableTls1.0"
      #     value = "1"
      #   }
      # ]

      # Optional: Uncomment if you want to set the DNS records in a specific DNS zone. 
      # dns_zone = {
      #   name = ""
      #   resource_group = ""
      #   ttl = 60
      # }
    }

    appServicePlan = {
      resource_group = "portal_app_service"
      os_type        = "Linux"
      sku_name       = "I1v2"
      # Optional: Uncomment if you want to set any of these parameters to values other than the defaults below. 
      # zone_balancing_enabled = false
      # maximum_elastic_worker_count = null
      # worker_count = 3
      # per_site_scaling_enabled = false
    }

    appService = {
      test = {
        resource_group                = "portal_app_service"
        enabled                       = true
        https_only                    = true
        # public_network_access_enabled = true
        # client_affinity_enabled                        = true
        # client_certificated_enabled                    = false
        # client_certificate_mode                        = "Required"
        # client_certificate_exclusion_paths             = ["/path1", "/path2"]
        ftp_publish_basic_authentication_enabled       = false
        # key_vault_reference_identity_id                = "Your Key Vault Identity ID"
        # virtual_network_subnet_id                      = "Your VNet Subnet ID"
        # webdeploy_publish_basic_authentication_enabled = true 
        # zip_deploy_file                                = "path/to/your/deployment.zip"

        # Optional: Uncomment to set Custom domain names for the app service
        # custom_hostname_binding = ["example.com"]

        # Required: The block can be empty but must be present
        site_config = {
          always_on = true
          # default_documents   = ["index.html", "index.php"]
          http2_enabled       = true
          minimum_tls_version = "1.2"
          # ftps_state          = "Disabled"
          # api_definition_url                            = "URL to your API definition"
          # api_management_api_id                         = "Your API Management API ID"
          # app_command_line                              = "Your command line to start the app"
          # container_registry_managed_identity_client_id = "Your Container Registry Managed Identity Client ID"
          # container_registry_use_managed_identity       = true
          # health_check_path                             = "/health"
          # health_check_eviction_time_in_min             = 5
          # ip_restriction_default_action                 = "Allow"
          # load_balancing_mode                           = "LeastRequests"
          # local_mysql_enabled                           = true
          # managed_pipeline_mode                         = "Integrated"
          # remote_debugging_enabled                      = true
          # remote_debugging_version                      = "VS2019"
          # scm_ip_restriction_default_action             = "Allow"
          # scm_minimum_tls_version                       = "1.2"
          # use_32_bit_worker                             = true
          # vnet_route_all_enabled                        = true
          # websockets_enabled                            = fals
          # worker_count                                  = 1

          # Optional: Uncomment to set any of these settings
          # application_stack = {
          #   docker_image_name        = "Your Docker Image Name"
          #   docker_registry_url      = "Your Docker Registry URL"
          #   docker_registry_username = "Your Docker Registry Username"
          #   docker_registry_password = "Your Docker Registry Password"
          #   dotnet_version           = "8.0"
          #   go_version               = "1.19"
          #   java_server              = "Your Java Server Type"
          #   java_server_version      = "Your Java Server Version"
          #   java_version             = "Your Java Version"
          #   node_version             = "20-lts"
          #   php_version              = "8.3"
          #   python_version           = "3.9"
          #   ruby_version             = "2.7"
          # }

          # Optional: Uncomment and set any key value pairs
          # app_setting = {}
        }
      }
    }
  }
}
