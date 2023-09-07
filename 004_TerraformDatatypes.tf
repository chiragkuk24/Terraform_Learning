#Declaring Variables
variable "myfirstvar"{
        type = number
        default=2
}

#Printing the Variable Value

output "The_Value_of_Variable_is_"{
        value = var.myfirstvar
}

#Working with String Datatype
variable "course"{
        type = string
        default = "Terraform"
}

output "Course_Name_is_"{
        value = var.course
}


#Working with list data types

variable "subjects"{
    type = list
    default = ["linux","python","aws","shellscritpting"]
}

output "Subjects_are_"{
    value = var.subjects[2]

}

#Working with map datatype

variable "topics"{
    type = map
    default = {
        "aws" = ["IAM","VPC","EC2","S3","RDS"]
        "linux" = ["Basics","Shell_Scripts","User Admin"]
    }
}
 output "Learned_Topics_are"{
    value = var.topics.linux[1]
 }