#Declaring Variables
variable "myfirstvar"{
        default=2
}

#Printing the Variable Value

output "The Value of Variable is "{
        value = var.myfirstvar
}