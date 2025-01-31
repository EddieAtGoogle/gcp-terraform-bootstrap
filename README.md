# GCP Bootstrap with Terraform

A secure foundation for your Google Cloud environment using Infrastructure as Code. This project helps new GCP users establish a well-architected, secure foundation following enterprise best practices.

## Overview

This project automatically sets up:
- A GCP organizational structure with dedicated folders
- Two separate projects for different workloads
- Enterprise-grade security policies
- Role-based access control (RBAC)

```plaintext
Organization
└── Folder (TF-GCP-Bootstrap)
    ├── Project 1 (App Development)
    │   └── IAM Group: Application Developers
    └── Project 2 (Data Science)
        └── IAM Group: Data Scientists
```

## Prerequisites

1. **Google Cloud Organization**
   - A Google Workspace or Cloud Identity account
   - Organization Admin role
   - Billing Account Administrator role

2. **Required Tools**
   - [Terraform](https://developer.hashicorp.com/terraform/downloads) (>= 1.0.0)
   - [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

3. **Google Groups Setup**
   1. Navigate to [Google Workspace Admin Console](https://admin.google.com)
   2. Go to Groups → Create Group
   3. Create two groups:
      - Application Developers group
      - Data Scientists group
   4. [Detailed Google Groups Setup Guide](https://support.google.com/a/answer/33343?hl=en)

## Quick Start

```bash
# Clone the repository
git clone [repository-url]

# Copy and edit configuration
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values

# Initialize and apply
terraform init
terraform plan
terraform apply
```

## Project Components

### 1. Organization Policies Module

Implements security guardrails including:
- Prevention of public GCS buckets
- VM external IP restrictions
- Resource location constraints
- Domain-restricted sharing

Key benefits:
- Prevents accidental data exposure
- Enforces network security
- Ensures regulatory compliance
- Controls resource deployment locations

[Learn more about GCP Organization Policies](https://cloud.google.com/resource-manager/docs/organization-policy/overview)

### 2. IAM Module

Sets up two permission sets:

1. **Application Developers**
   - Cloud Run deployment
   - Cloud Functions management
   - Basic Vertex AI access
   - Cloud Build management

2. **Data Scientists**
   - Full Vertex AI access
   - Notebook management
   - BigQuery access
   - Storage management

[Learn more about GCP IAM Best Practices](https://cloud.google.com/iam/docs/best-practices-for-using-and-managing-service-accounts)

## Project Structure

```plaintext
.
├── main.tf                    # Main Terraform configuration
├── variables.tf               # Variable definitions
├── outputs.tf                # Output definitions
├── versions.tf               # Provider and version constraints
├── terraform.tfvars.example  # Example variable values
└── modules/
    ├── org-policies/         # Organization policies configuration
    │   ├── main.tf          # Policy definitions
    │   ├── variables.tf     # Policy variables
    │   └── outputs.tf       # Policy outputs
    └── iam/                  # IAM roles and permissions
        ├── main.tf          # Role assignments
        ├── variables.tf     # IAM variables
        └── outputs.tf       # IAM outputs
```

## Security Features

- ✅ Least privilege access through role-based permissions
- ✅ Resource isolation with separate projects
- ✅ Network security with VM external IP restrictions
- ✅ Data protection through bucket access controls
- ✅ Compliance support with location restrictions

## Customization

1. Edit `terraform.tfvars` for basic configuration:
   - Organization ID
   - Billing Account
   - Project names
   - Google Groups

2. Modify modules for additional policies or roles:
   - Add new organization policies in `modules/org-policies/main.tf`
   - Add additional IAM roles in `modules/iam/main.tf`

## Common Issues and Solutions

1. **Permission Errors**
   - Ensure you have Organization Admin role
   - Verify billing account access
   - Check Google Groups membership

2. **Project ID Conflicts**
   - Project IDs include random suffix for uniqueness
   - Change base names in terraform.tfvars if needed

3. **API Enablement**
   - Required APIs are enabled automatically
   - May need to wait a few minutes after project creation

## Getting Help

1. Check the [GCP Documentation](https://cloud.google.com/docs)
2. Review [Terraform GCP Provider Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
3. Open an issue in this repository

## Contributing

Contributions welcome! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file.
