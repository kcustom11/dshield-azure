This is a modification of Azure Terraform code in main DShield repo https://github.com/DShield-ISC/dshield

### For instructions on how to install `terraform`, please consult the following: 
- [HashiCorp Terraform Installation](https://learn.hashicorp.com/tutorials/terraform/install-cli)  

### Configure Azure with a service principal:
- [Powershell guide](https://learn.microsoft.com/en-us/powershell/azure/create-azure-service-principal-azureps?view=azps-11.0.0)
- [Hashicorp guide](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)

### Create a .azconfigurevars file to generate environment variables for the service principal secrets
```
export ARM_CLIENT_SECRET=
export ARM_CLIENT_ID=
export ARM_TENANT_ID=
export ARM_SUBSCRIPTION_ID=
export AZURE_LOCATION=eastus
export AZURE_VM_SIZE=
```

### Create a DShield ISC account
- [https://www.dshield.org/login.html](https://www.dshield.org/login.html)

### Create a .tfvars file with the following. These will be generated when you create an ISC account.
```
dshield_email=""
dshield_apikey=""
dshield_userid=""
```

### Optional variables:
- **honeypot_nodes** (default: `1` *increase to scale horizontally*)
- **azure_region** (default: `East US`)            _if using **Azure**_
- **azure_image_size** (default: `Standard_B1ls`)  _if using **Azure**_
- **honeypot_network** (default: `10.40.0.0/16` for VPC & `10.40.0.0/24` for SG)
- **honeypot_ssh_port** (default: `12222`)
- **dshield_ca_country** (default: `US`)
- **dshield_ca_state** (default: `Florida`)
- **dshield_ca_city** (default: `Jacksonville`)
- **dshield_ca_company** (default: `DShield`)
- **dshield_ca_depart** (default: `Decoy`)

- SSH credentials are contained in the default location: 
  - `~/.ssh/id_rsa`
  - `~/.ssh/id_rsa.pub`

### After completing the above items, run the following commands to begin the installation:
```terraform init; terraform plan --var-file=.tfvars -out=honeypot; terraform apply "honeypot"```  
**OR**  
```terraform init; terraform apply``` and type `yes` when prompted
