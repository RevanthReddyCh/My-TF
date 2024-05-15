vpc-name = "*******************"
vpc-cidr = "172.168.0.0/16"
#subnets-cidr = ["********","********","********"]
subnets-cidr = {
     "public-subnet"  = "172.168.1.0/24"
     "private-subnet" = "172.168.2.0/24"

 }
az = ["ap-south-2a", "ap-south-2b"]
instance_type = "t3.micro"
ami = ["ami-008616ec4a2c6975e"]