# Launch an ec2 instance under a default subnet and VPC using terraform template

To Lauch an ec2 instance under default subnet and VPC using terraform we first write terraform configuration as follows in main.tf file

```
provider "aws" {
  region = "us-east-1"  
}

resource "aws_instance" "example" {
  ami           = "ami-0e731c8a588258d0d"  
  instance_type = "t2.micro"                
  subnet_id     = "${aws_subnet.default.id}"
  associate_public_ip_address = true 
  
}

resource "aws_subnet" "default" {
  vpc_id     = "${aws_vpc.default.id}"      
  cidr_block = "10.0.1.0/24"                
  
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"                
}


output "instance_ip" {
  value = aws_instance.example.public_ip
}

```

Then run the following commands:

Initialize Terraform:
```
terraform init
```


Review the execution plan:
```
terraform plan
```

Apply the configuration to create the resources:

```
terraform apply
```
This will create a VPC, a subnet within that VPC, and an EC2 instance in that subnet.

Ec2 instance created 
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/74f9ad93-6b28-4e41-a301-da87889380c4)

VPC Default created
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/ab8e7f16-22bb-4776-a9c0-8dff84aee5a3)

Subnet to default VPC Created above
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/fa8c4081-86b9-4e1e-b866-824d7afb80e6)


Submitted By _Shiva Kumar Gorasa_










