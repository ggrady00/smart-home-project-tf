module "network" {
  source        = "./modules/networking"
  vpc_cidr      = var.vpc_cidr
  vpc_name      = var.vpc_name
  public_cidrs  = var.public_cidrs
  private_cidrs = var.private_cidrs
  azs           = var.azs
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "server" {
  source                 = "./modules/app-servers"
  instance_type          = var.instance_type
  security_group_ids     = module.security.security_group_ids
  key_name               = var.key_name
  public_subnets         = module.network.public_subnets
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
  target_group_arn       = module.load_balancer.tg_arn
  ami_id                 = var.ami_id
  autoscaling_group_name = var.autoscaling_group_name
  lb_dns = module.load_balancer.lb_dns
}

module "database" {
  source = "./modules/database"
}

module "load_balancer" {
  source = "./modules/load-balancing"
  vpc_id = module.network.vpc_id
  public_subnets = module.network.public_subnets
  lb_security_groups = module.security.lb_security_groups

}