locals{
  test = "hello world"
}

variable "ATLAS_WORKSPACE_NAME"{
}

resource "null_resource" "exampleB" {
  triggers = {
      key   = "hello"
      value = "world"
  }
}

output "test"{
  value = local.test
}

output "workspace"{
  value = var.ATLAS_WORKSPACE_NAME  
}
