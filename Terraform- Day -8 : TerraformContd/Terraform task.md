# Write Terraform script to create highly available infrastructure in AWS. The infra should have1 vpc, 3 subnets setup in 3 different az and 2 instances setup in 2 different subnets


## The following Terraform code creates:


```
provider "aws" {
  region = "us-east-1"  
}

resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"  
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "TEST_VPC"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.1.0/24"  
  availability_zone       = "us-east-1a"  
  map_public_ip_on_launch = true

  tags = {
    Name = "SubnetA"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.2.0/24"  
  availability_zone       = "us-east-1b"  
  map_public_ip_on_launch = true

  tags = {
    Name = "SubnetB"
  }
}

resource "aws_subnet" "subnet_c" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.0.3.0/24"  
  availability_zone       = "us-east-1c"  

  tags = {
    Name = "SubnetC"
  }
}

resource "aws_instance" "instance_a" {
  ami           = "ami-0c7217cdde317cfec"  
  instance_type = "t2.micro"      
  subnet_id     = aws_subnet.subnet_a.id

  tags = {
    Name = "InstanceA"
  }
}

resource "aws_instance" "instance_b" {
  ami           = "ami-0c7217cdde317cfec"  
  instance_type = "t2.micro"      
  subnet_id     = aws_subnet.subnet_b.id

  tags = {
    Name = "InstanceB"
  }
}

output "instance_a_public_ip" {
  value = aws_instance.instance_a.public_ip
}

output "instance_b_public_ip" {
  value = aws_instance.instance_b.public_ip
}
```

  1. A VPC with the specified CIDR block, DNS support, and DNS hostnames enabled.
  2. Three subnets in different availability zones with specified CIDR blocks.
  3. Two instances, each placed in a different subnet for high availability.
  4. and Outputs public ip of instances

## Use _terraform plan_ to know what resources are being created , here it gave following :
```
PS C:\Users\shivagor\Documents\Terraform Demo> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.instance_a will be created
  + resource "aws_instance" "instance_a" {
      + ami                                  = "ami-0c7217cdde317cfec"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "InstanceA"
        }
      + tags_all                             = {
          + "Name" = "InstanceA"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_instance.instance_b will be created
  + resource "aws_instance" "instance_b" {
      + ami                                  = "ami-0c7217cdde317cfec"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "InstanceB"
        }
      + tags_all                             = {
          + "Name" = "InstanceB"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_subnet.subnet_a will be created
  + resource "aws_subnet" "subnet_a" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "SubnetA"
        }
      + tags_all                                       = {
          + "Name" = "SubnetA"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.subnet_b will be created
  + resource "aws_subnet" "subnet_b" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "SubnetB"
        }
      + tags_all                                       = {
          + "Name" = "SubnetB"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.subnet_c will be created
  + resource "aws_subnet" "subnet_c" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "SubnetC"
        }
      + tags_all                                       = {
          + "Name" = "SubnetC"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.test_vpc will be created
  + resource "aws_vpc" "test_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "TEST_VPC"
        }
      + tags_all                             = {
          + "Name" = "TEST_VPC"
        }
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + instance_a_public_ip = (known after apply)
  + instance_b_public_ip = (known after apply)

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

## When _terraform apply_ was given the above resources are created with following outputs 
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/110226d7-f7ef-468e-9b87-3f7bdf769ef9)


## two ec2 instances are created 
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/09d3d625-45f1-4a31-b5cb-cd4925c1dff6)

## with TEST_vpc that we have created 
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/e87a586a-3919-419a-b2cd-d9c5e95ae76b)

## with 3 Subnets in different Availability zones under TEST_vpc and two subnets associated to "instance a" and "instance b"
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/8fb61c6e-690f-41c1-b461-0e313284596d)


Lastly remove all created resources with single command i.e, _terraform destroy_
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/95bfc1d7-f0b2-418f-98ca-a37a357889ec)


## _Submitted by Shiva Kumar Gorasa_




