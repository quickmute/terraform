variable "ATLAS_WORKSPACE_NAME"{
}

locals{
  version = "1.1"
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

output "workspace"{
  value = var.ATLAS_WORKSPACE_NAME  
}
