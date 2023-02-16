

variable "username" {
    type = string
}

output printname{
	value = "Hello, ${var.username}"
}