provider "tfe" {
  token = var.token
}

variable "ATLAS_WORKSPACE_NAME" {
  type        = string
  description = "the tfe environment variable that contains the workspace name. Should be automatically populated via terraform run."
}

output "atlas"{
    value = var.ATLAS_WORKSPACE_NAME
}

variable "token"{
  default = ""
}

locals{
  version = "1.1"
}

variable "environment"{
  default = "dev"
}

locals {
    env_map = {
        "dev" = "p"
        "qa" = "q"
        "uat" = "u"
        "prod" = "p"
    }
    env_abv = lookup(local.env_map,var.environment,"Unknown") 
}

output "env_abv"{
    value = local.env_abv
}


resource "null_resource" "trigger" {
  triggers = {
      key   = "hello"
      value = formatdate("YYYY-MM-DD hh:mm:ssZZZZZ", timestamp())
  }
}

resource "null_resource" "envs" {
  provisioner "local-exec" {
      command = "printenv"
  }
}

output "version"{
  value = local.version
}

module "embshd" {
  source  = "app.terraform.io/embshd/embshd/aws"
  version = "2.0.0"
}

output "embshd"{
  value = module.embshd.timestamp
}

data "tfe_organization_membership" "mine" {
  organization  = "embshd"
  email = "hyon24@gmail.com"
}

output "member_id"{
  value = data.tfe_organization_membership.mine.id
}
  
resource "tfe_workspace" "managed-workspace" {
  name         = "managed-workspace"
  organization =  "embshd"
}

resource "tfe_variable" "managed_1"{
  key = "managed_1"
  value = ""
  category = "terraform"
  workspace_id = tfe_workspace.managed-workspace.id
}
