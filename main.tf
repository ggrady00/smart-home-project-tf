module "network" {
  source = "./modules/Networking"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  public_cidrs = var.public_cidrs
  private_cidrs = var.private_cidrs
  azs = var.azs
}