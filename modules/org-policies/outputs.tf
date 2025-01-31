output "enabled_policies" {
  description = "List of enabled organizational policies"
  value = [
    "storage.publicAccessPrevention",
    "gcp.resourceLocations",
    "compute.vmExternalIpAccess",
    "compute.requireOsLogin",
    "compute.restrictSharedVpcHostProjects",
    "iam.disableServiceAccountKeyCreation",
    "compute.vmCanIpForward"
  ]
} 