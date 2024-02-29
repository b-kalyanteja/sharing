# to login to AWS
provider "aws" {
  region     = var.reg
  access_key = "akey" #needed if localmachine is not logged in to AWS
  secret_key = "skey"
}
