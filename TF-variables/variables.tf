variable "vpc-name" {}
variable "vpc-cidr" {}
variable "subnets-cidr" {
    type = map
}
variable "instance_type" {}
variable "ami" {}
variable "az" {}


/*
Type of variables
string ""
list ["10", "20", "30", "40"]
          0   1    2    3
type = list(number) [10,20,30,40]
type = list(string) ["hi","how","are","you"]

boolean true/false
Map  'key' = 'value'
*/