

output printname{
	value = "Hello, ${var.username}, your age is ${var.age}"
}


// terraform plan -var "username=snehal" -var "age=23"