locals{
  test = "hello world"
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
