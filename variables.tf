# number of honeypot instances to deploy
variable "honeypot_nodes" {
  type    = number
  default = 1
}

# put these variables in a .tfvars file
variable "dshield_email" {
  type = string
}

variable "dshield_userid" {
  type = string
}

variable "dshield_apikey" {
  type = string
}

# location of YOUR ssh PUBLIC key to be uploaded to AZURE
# complimentary key pair to PRIVATE key below
variable "azure_ssh_key_pub" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

# location of YOUR ssh PRIVATE key to run remote-exec provisioners
# complimentary key pair to PUBLIC key above
variable "azure_ssh_key_priv" {
  type    = string
  default = "~/.ssh/id_rsa"
}

# Azure region in which instances should be deployed
variable "azure_region" {
  type    = string
  default = "East US"
}

# Canonical Azure OwnerId
variable "azure_image_owner" {
  type    = string
  default = "Canonical"
}

variable "azure_image_offer" {
  description = "Ubuntu Jammy"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "azure_image_sku" {
  description = "22_04-lts-gen2"
  type        = string
  default     = "22_04-lts-gen2"
}

variable "azure_image_user" {
  description = "Ubuntu default user"
  type        = string
  default     = "ubuntu"
}

variable "azure_image_size" {
  type    = string
  default = "Standard_B1ls"
}

variable "azure_hdd_size" {
  type    = string
  default = "Standard_LRS"
}

variable "azure_tag" {
  type    = string
  default = "dshield_honeypot"
}

# CIDR is declared in azurerm_virtual_network & azurerm_subnet code blocks in main.tf
variable "honeypot_network" {
  type    = string
  default = "10.40.0.0"
}

variable "honeypot_ssh_port" {
  type    = string
  default = "12222"
}

variable "dshield_ca_country" {
  type    = string
  default = "US"
}

variable "dshield_ca_state" {
  type    = string
  default = "Florida"
}

variable "dshield_ca_city" {
  type    = string
  default = "Jacksonville"
}

variable "dshield_ca_company" {
  type    = string
  default = "DShield"
}

variable "dshield_ca_depart" {
  type    = string
  default = "Decoy"
}

# true or false whether cowrie should output json
# also appends logrotate policy in /etc/logrotate.d/dshield
variable "output_logging" {
  type    = bool
  default = true
}
