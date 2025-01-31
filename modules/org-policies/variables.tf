variable "organization_id" {
  description = "The organization ID to apply policies to"
  type        = string
}

variable "allowed_shared_vpc_host_projects" {
  description = "List of projects allowed to be Shared VPC hosts"
  type        = list(string)
  default     = []
}

variable "allowed_ip_forwarding_projects" {
  description = "List of projects allowed to use IP forwarding"
  type        = list(string)
  default     = []
} 