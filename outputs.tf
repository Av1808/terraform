#If using count=n in ec2 instance
# output "ec2_instance_public_ip"{
#     description = "public ip for ec2"
#     value = aws_instance.myec2[*].public_ip
# }
# output "ec2_state"{
#     description = "state of ec2"
#     value = aws_instance.myec2[*].instance_state
# }
output "forlists"{
    description = "testing for loop"
    value = [for i in var.peeps:"Avi ${i}"]
}
output "formaps"{
    description = "print map"
    value = [for i,j in var.instance_types:"${i} -> ${j}"]
}

output "azones"{
    description = "print azones fetched"
    value = [for i in data.aws_availability_zones.myzones:i]
}

#If you want to use for each and dael with a  map of ec2s
output "ec2_instance_public_ip"{
    description = "public ip for ec2"
    value = [for i in aws_instance.myec2:i.public_ip]
}
output "ec2_state"{
    description = "state of ec2"
    value = [for i in aws_instance.myec2:i.instance_state]
}