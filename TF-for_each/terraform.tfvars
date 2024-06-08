vpc-name = "function-vpc"
vpc-cidr = "172.168.0.0/16"
subnets_cidr = {
    "us-west-2a" = "172.168.1.0/26",
    "us-west-2b" = "172.168.2.0/26",
    "us-west-2c" = "172.168.3.0/26" 
    }
pri-subnets-cidr = {
    "us-west-2a" = "172.168.4.0/26",
    "us-west-2b" = "172.168.5.0/26",
    "us-west-2c" = "172.168.6.0/26" 
    }
ami = "ami-0cf2b4e024cdb6960"
keypair = "us-west-2"
instance-type = "t2.micro"
instance-name = "public-instance"
