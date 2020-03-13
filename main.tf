locals{
  test = "hello world"
}

variable "ATLAS_WORKSPACE_NAME"{
}

resource "null_resource" "exampleB" {
  triggers = {
      key   = "hello"
      value = formatdate("YYYY-MM-DD hh:mm:ssZZZZZ", timestamp())
  }
}

output "test"{
  value = local.test
}

output "workspace"{
  value = var.ATLAS_WORKSPACE_NAME  
}
