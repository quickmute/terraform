locals{
  version = "1.1"
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



