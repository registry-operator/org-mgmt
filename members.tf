module "shanduur" {
  source   = "./modules/member"
  username = "shanduur"
  role     = "admin"
}

module "shanduur_auto" {
  source   = "./modules/member"
  username = "shanduur-auto"
  role     = "admin"
}

module "niesmaczne" {
  source   = "./modules/member"
  username = "niesmaczne"
}
