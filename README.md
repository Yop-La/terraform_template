# Foodles Cloud Functions

This Terraform project is designed to manage AWS infrastructure across multiple environments: development (dev), staging, and production (prod).

It's specifically designed to deploy AWS Lambda functions but can be extended to include other resources as needed.

## Prerequisites

Before starting, ensure you meet the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed (version 1.7.2 or higher)
- An AWS account with [necessary access rights](https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html)
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured
- Python 3.11 for AWS Lambda functions

## Initial Setup

1. **Clone the Repository**

    ```bash
    git clone https://github.com/foodles-tech/FoodlesCloudFunctions
    cd FoodlesCloudFunctions
    ```

2. **Configure AWS CLI**

    Ensure your AWS CLI is configured with the appropriate credentials:

    ```bash
    aws configure
    ```

3. **Configure Secrets**

    Update the `secrets.tfvars` file with appropriate values for secrets. Never commit this file to your repository.

## Quick Start

To deploy infrastructure in a specific environment (e.g., dev-alegui), follow these steps:

1. Define your development environment name. For example, `dev-alegui` if your name is Alexandre Guillemine.

2. **Initialize Terraform**

    Navigate to the environment directory and initialize Terraform:

    ```bash
    cd environments/dev
    terraform init
    ```

3. **Plan Changes**

    Review the changes Terraform plans to apply:

    ```bash
    terraform plan -var-file="../../secrets.tfvars"
    ```
   
    Make sure to enter the correct environment name when prompted.


4. **Apply Changes**

    Apply the changes to deploy the infrastructure:

    ```bash
    terraform apply -var-file="../../secrets.tfvars"
    ```

    Make sure to enter the correct environment name when prompted.

    Confirm with `yes` when Terraform asks for approval to proceed.

Staging and production are deployed in the ci/cd pipelines of the repository with github actions.

## Cleanup

To destroy the infrastructure deployed with Terraform:

```bash
terraform destroy -var-file="../../secrets.tfvars"
```

Confirm with `yes` to proceed.

## Contributing

To contribute to this project:

1. **Create a New Branch**

    Create a new branch for your feature or fix:

    ```bash
    git checkout -b feature/your_feature_name
    ```

2. **Make a Pull Request (PR)**

    After making your changes, push your branch and open a pull request against the `master` branch for review.

3. **Staging Deployment**

    A push to an open PR triggers a GitHub Action that deploys to the staging environment. This allows for automated testing and review in a live environment.

4. **Production Deployment**

    When a PR is merged into `master`, it triggers a GitHub Action that deploys to the production environment, ensuring that changes are rolled out safely and efficiently.

## Environment Management

Environments are managed within the same AWS account, distinguishing objects of different environments using prefixes (dev, staging, master). This approach allows for simplified management while maintaining clear separation and organization of resources across environments.

For example, a Lambda function in the `dev` environment might have the following name: `dev-alegui-my-function`.

## CI/CD

This project includes two GitHub Actions workflows defined in `.github/workflows` to automate the CI/CD process for managing infrastructure deployments across different environments.

### Workflows:

1. **`deploy-prod` Workflow:** This workflow is designed to handle deployments to the production environment. It is triggered on merges to the `master` branch. The purpose of this pipeline is to ensure that any changes merged into `master` are automatically deployed to the production environment, facilitating a seamless CI/CD process for critical infrastructure updates.

2. **`deploy_to_staging` Workflow:** This workflow focuses on deployments to the staging environment and is triggered by creating or updating a pull request. The staging environment serves as the testing ground for all new features, bug fixes, and updates. This automation ensures that every pull request is automatically deployed to the staging environment, allowing for live testing and review before the changes are merged into `master` and subsequently deployed to production.

### State Management:

For both staging and production environments, the Terraform state files (`tfstate`) are securely stored on AWS S3 in the bucket named `"foodles-cloud-function-terraform-state"`. This centralized state management enables teams to collaborate on infrastructure updates more efficiently, ensuring that the state is consistently managed and versioned. It also provides a robust backup mechanism for Terraform state files, adding an additional layer of security and recoverability for infrastructure as code.

Using S3 for state storage also enables features like state locking and history, which further enhance the safety and auditability of infrastructure changes. Make sure to configure the appropriate access policies on the S3 bucket to secure your Terraform state files.

## AWS credentials

AWS credentials are stored in the github secrets of the repository. The secrets are used in the github actions to authenticate the terraform commands.