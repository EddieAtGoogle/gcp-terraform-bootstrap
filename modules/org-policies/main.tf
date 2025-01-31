# Prevent public access to GCS buckets
# This policy enforces uniform bucket-level access and prevents public access to Cloud Storage data
# It helps prevent data exposure through misconfigured bucket permissions
# Doc: https://cloud.google.com/storage/docs/public-access-prevention
resource "google_org_policy_policy" "storage_public_access_prevention" {
  name   = "organizations/${var.organization_id}/policies/storage.publicAccessPrevention"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = true
    }
  }
}

# Restrict resource location to specific regions
# This policy ensures that GCP resources are only created in approved geographic locations
# Useful for data residency requirements and compliance with regulations like GDPR
# You can specify locations using:
# - Individual regions (us-central1)
# - Multi-regions (us-locations)
# - Custom locations
# Doc: https://cloud.google.com/resource-manager/docs/organization-policy/defining-locations
resource "google_org_policy_policy" "resource_location" {
  name   = "organizations/${var.organization_id}/policies/gcp.resourceLocations"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      values {
        allowed_values = [
          "in:us-locations",
          "in:europe-locations"
        ]
      }
    }
  }
}

# Restrict VM external IP access
# This policy prevents VMs from being assigned external IP addresses
# Forces the use of Cloud NAT or VPN for internet access, improving security
# Best practice is to use internal IPs and control internet access through centralized egress points
# Doc: https://cloud.google.com/compute/docs/ip-addresses/reserve-static-external-ip-address#disableexternalip
resource "google_org_policy_policy" "vm_external_ip_access" {
  name   = "organizations/${var.organization_id}/policies/compute.vmExternalIpAccess"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      deny_all = true
    }
  }
}


# Require OS Login
# This policy enforces the use of OS Login for all VMs
# OS Login provides:
# - Automated SSH key management
# - Fine-grained IAM roles for SSH access
# - Centralized user management
# - Integration with Cloud Audit Logs
# Doc: https://cloud.google.com/compute/docs/oslogin
resource "google_org_policy_policy" "require_os_login" {
  name   = "organizations/${var.organization_id}/policies/compute.requireOsLogin"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = true
    }
  }
}

# Restrict Shared VPC hosting to specific projects
# This policy controls which projects can host Shared VPCs
# Shared VPC allows organizations to:
# - Centralize network management
# - Share network resources across projects
# - Implement hub-and-spoke network architectures
# Best practice is to limit this capability to dedicated network admin projects
# Doc: https://cloud.google.com/vpc/docs/shared-vpc
resource "google_org_policy_policy" "shared_vpc_hosting" {
  name   = "organizations/${var.organization_id}/policies/compute.restrictSharedVpcHostProjects"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      values {
        allowed_values = var.allowed_shared_vpc_host_projects
      }
    }
  }
}

# Disable service account key creation
# This policy prevents the creation of service account keys
# Service account keys are long-term credentials that pose security risks:
# - They can be copied and used outside of GCP
# - They don't expire by default
# - They're harder to audit and rotate
# Instead, use:
# - Workload Identity for GKE
# - Service Account Impersonation
# - Cloud Run and Cloud Functions built-in service accounts
# Doc: https://cloud.google.com/iam/docs/best-practices-for-managing-service-account-keys
resource "google_org_policy_policy" "disable_sa_key_creation" {
  name   = "organizations/${var.organization_id}/policies/iam.disableServiceAccountKeyCreation"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      enforce = true
    }
  }
}

# Restrict IP forwarding to specific projects
# This policy controls which projects can create instances that forward IP packets
# IP forwarding is needed for:
# - Network virtual appliances
# - Load balancers
# - NAT gateways
# Best practice is to limit this capability to networking admin projects
# Doc: https://cloud.google.com/vpc/docs/using-routes#canipforward
resource "google_org_policy_policy" "vm_can_ip_forward" {
  name   = "organizations/${var.organization_id}/policies/compute.vmCanIpForward"
  parent = "organizations/${var.organization_id}"

  spec {
    rules {
      values {
        allowed_values = var.allowed_ip_forwarding_projects
      }
    }
  }
} 