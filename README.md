# Terraform Project

## Deploying a new version of the smart-home services

### Variables

#### Networking

vpc_cidr = cidr range of vpc - String\
vpc_name = name of new vpc - String\
azs = List of AZs where subnets will be created - List of Strings\
public_subnets = List of CIDR blocks to assign to each public subnet - List of Strings\
private_subnets = List of CIDR blocks to assign to each private subnet - List of Strings

#### Server

instance_type = instance type - String\
key_name = Key pair name - String\
min_size = minimum number of auto-scaling instances - String\
max_size = maximum number of auto-scaling instances - String\
desired_capacity = desired number of auto-scaling instances - String\
ami_id = list of image IDs for each launch template - provided in order > lighting app | heating app| status app - List of Strings\
autoscaling_group_name = names of auto-scaling groups - List of Strings

### Outputs

LB_DNS = The DNS name of the Load Balancer

### Setup

After running `terraform apply` the lighting and heating applications will be accessible through the load balancer. The status application should have access to the lighting and heating endpoints from the user-data.sh file.