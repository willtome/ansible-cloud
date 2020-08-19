provider "aws" {
 region = "us-east-1"
}

data "aws_vpcs" "my_vpc" {
    tags = {
        Name = "wtome-vpc"
    }
}

data "aws_subnet_ids" "my_subnet" {
    vpc_id = "${tolist(data.aws_vpcs.my_vpc.ids)[0]}"
    tags = {
        Name = "wtome-subnet"
    }
}

resource "aws_instance" "k8s-master-1" {
    ami = "ami-08e923f2f38197e46"
    instance_type = "t2.micro"
    key_name = "wtome-lightbulb"
    vpc_security_group_ids = ["sg-030d834a"]
    subnet_id = tolist(data.aws_subnet_ids.my_subnet.ids)[0]
    associate_public_ip_address = true
    tags = {
        Name = "k8s-master-1"
        Owner = "wtome"
        Group = "k8s_master"
        Platform = "linux"
    }
}

resource "aws_instance" "k8s-master-2" {
    ami = "ami-08e923f2f38197e46"
    instance_type = "t2.micro"
    key_name = "wtome-lightbulb"
    vpc_security_group_ids = ["sg-030d834a"]
    subnet_id = tolist(data.aws_subnet_ids.my_subnet.ids)[0]
    associate_public_ip_address = true
    tags = {
        Name = "k8s-master-2"
        Owner = "wtome"
        Group = "k8s_master"
        Platform = "linux"
    }
}

resource "aws_instance" "k8s-master-3" {
    ami = "ami-08e923f2f38197e46"
    instance_type = "t2.micro"
    key_name = "wtome-lightbulb"
    vpc_security_group_ids = ["sg-030d834a"]
    subnet_id = tolist(data.aws_subnet_ids.my_subnet.ids)[0]
    associate_public_ip_address = true
    tags = {
        Name = "k8s-master-3"
        Owner = "wtome"
        Group = "k8s_master"
        Platform = "linux"
    }
}