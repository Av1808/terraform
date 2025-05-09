#File for input variables used by c1-versions.tf
#They serve as a parametr for module, so w can customize and make them portable


variable "aws_region" {
    type = string
    default = "us-east-2"
    description = "Region for my ec2 instance"
}

# variable "aws_image"{
#     type = string
#     default = "ami-0f6c1051253397fef"
#     description = "The linux image running on my ec2 instance"
#     validation {
#       condition = substr(var.aws_image,0,4) == "ami-"
#       error_message = "Wrong AMI"
#     }
# }

variable "ssh_key"{
    type = string
    default = "Avi_Singh"
    description = "Private key name stored locally"
}

variable "db_username" {
  description = "AWS RDS Database Administrator Username"
  type        = string
  default = "root"
  sensitive   = true
}

variable "db_password" {
  description = "AWS RDS Database Administrator Password"
  default = "calvin"
  type        = string
  sensitive   = true
}

variable "peeps" {
  description = "AWS RDS Database Administrator Password"
  default     = ["amazon", "azure", "google"]
  type        = list(string)
}

variable "instance_types"{
    description = "list of instance types"
    type = map(string)
    default = { 
        "small"="t3.micro"
        "medium"="t3.medium" 
    }
}

