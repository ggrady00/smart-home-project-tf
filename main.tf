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