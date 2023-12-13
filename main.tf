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
  source             = "./modules/app-servers"
  instance_type      = var.instance_type
  security_group_ids = module.security.security_group_ids
  key_name           = var.key_name
  public_subnets     = module.network.public_subnets
  server_names       = var.server_names
}

module "load_balancer" {
  source = "./modules/load-balancing"
  vpc_id = module.network.vpc_id
  lighting_server_id = module.server.lighting_server_id
  heating_server_id = module.server.heating_server_id
  status_server_id = module.server.status_server_id
  public_subnets = module.network.public_subnets
  lb_security_groups = module.security.lb_security_groups

}