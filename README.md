# SRE-Infra-Practice
This project is a self designed infrastructure setup to practice tools and automations that covers all infra tools. 

## Initial Plan
- Terraform1 is the local terraform setup used to provision infrastructure for tools VPC and tools
- Tools VPC will have an EC2 instance of size t2.xlarge to support Jenkins, vault, Terraform, etc applications
- jenkins can be used to trigger Terraform2 for APP VPC setup and applications deployment
- All the credentials are stored in Vault
- Vault approles are used to get termporary credentials for all applications.

# Storage Goals
- All appication data is planned to be stored in an EFS storage which can be detached and attached to save costs. 
- Experimenting with EFS is important


