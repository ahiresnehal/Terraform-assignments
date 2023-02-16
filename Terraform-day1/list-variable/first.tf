

output printfirst{
	#value = "First user is ${var.users[0]}"
	value = "${join("-->",var.users)}"
}

output helloworld{
	value = "${upper(var.users[0])}"
}

output helloworldlower{
	value = "${lower(var.users[1])}"
}

output helloworldtitle{
	value = "${title(var.users[2])}"
}