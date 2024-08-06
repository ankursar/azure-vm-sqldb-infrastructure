# Infrastructure as Code repository template

This shared repository template can be used as a starting point for IaC repositories. It will automatically setup the right templates for Pull requests and configure GitHub Actions workflows for code review and deploy of your IaC. Click on the top of this Github page USE THIS TEMPLATE to create a new Repository containing the folderstructure and files used in the repository.

## Step by step guide

### Setting up the repository (manual steps for now)

#### 1. Create a repository using this template by clicking "USE THIS TEMPLATE" button.

#### 2. If you are going to work with Azure AD (do something with RBAC) your SPNs should be added to "cld-aleu-ahtech-rol-activedirectory_readers" technical group. That can be done via [ah-tech-enablement-rbac](https://github.com/RoyalAholdDelhaize/ah-tech-enablement-rbac) repository. See [example](https://github.com/RoyalAholdDelhaize/ah-tech-enablement-rbac/blob/55d18b6aecaf7b0e7652033d205c1b79f8cb4212/Deployments/platformteam_retailtech/deploy_rbac_supplychain.json#L1087-L1101).

#### 3. Configure [federation credentials](https://github.com/RoyalAholdDelhaize/storm-terraform/blob/beast-docs/docs/openid-connect.md) (primary approach) for your SPNs, otherwise you will be required to use SPN secret with manual maintenance in case of rotation.

#### 4. Create the following environments in your repostory:

- dev
- tst
- acc
- prd
- dev-plan
- tst-plan
- acc-plan
- prd-plan

> **_NOTE:_**  ⚠️Set the approval flow for high level environemnts (at least for acc and prd).

#### 5. Define required repository and environment secrets.

Set as **Environment secrets**

- ARM_CLIENT_ID
- ARM_CLIENT_SECRET (If federated credentials are not used)
- ARM_SUBSCRIPTION_ID
- MONGODB_ATLAS_PUBLIC_KEY (If MongoDB Atlas is used)
- MONGODB_ATLAS_PRIVATE_KEY (If MongoDB Atlas is used)

Set as **Repository secrets**

- ARM_TENANT_ID

#### 6. Onboard you repository into GitHub Actions private runners

- After creation of your repository, private runners for GitHub Actions will be assigned automatically (typically in under 15 minutes) as well as the 'readonly-internal' app (120 minutes). Without these having been provisioned, your pipeline will fail to run (or wait for a runner to be available).

#### 7. Create a Pull Request with the following changes

- Replace values in example `*.tf` with your own file, and add your own `*.tf` files for your infra stack.
- Define values for the state file in the backend files (`<env_name>/azurerm.tfbackend`) and environent variables (`<env_name>/terraform.tfvars`). Add/Remove additional environments folders e.g. acc/prd.
- In general, add what you miss and remove what you do not need

#### 8. Make sure to solve the checks in the PR

- For example `tflint` and `tfsec` will run. You may need to solve errors related to it.
- If you want to test `tflint` locally, see [its repo](https://github.com/terraform-linters/tflint) on how to run it locally. If you use Docker, a single line command may be `docker run --rm -v $(pwd):/data -t ghcr.io/terraform-linters/tflint`

#### 9. Assign a Admin role for SRE Retail Tech Platform

- Assign the admin role to the 'SRE Retail Tech Platform' team on the repo. That allows us to help contribute and review any PRs.

#### 10. Happy coding
