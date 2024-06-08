variable "vpc-name" {}
variable "vpc-cidr" {}
variable "subnets_cidr" {
    type = map(string)
}
#variable "azs" {}
variable "ami" {}
variable "keypair" {}
variable "instance-type" {}
variable "instance-name" {}
variable "pri-subnets-cidr" {
    type = map(string)
}