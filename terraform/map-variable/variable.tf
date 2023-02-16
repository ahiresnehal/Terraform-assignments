variable "usersage"{
    type = map
    default = {
        snehal = 20
        sanket = 19
    }
}

variable "username"{
    type = string
}

output "userage"{
    value = "my name is ${var.username} and my age is ${lookup(var.usersage,"${var.username}")}"
}