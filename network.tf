
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs                = ["eu-west-2a", "eu-west-2b"]
  enable_nat_gateway = true

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

}

module "aws_logs" {
  source         = "trussworks/logs/aws"
  s3_bucket_name = "dev-ops-logs"
  region         = "eu-west-2"
}


output "test" {
  value = module.vpc.vpc_id
}

output "test2" {
  value = module.vpc.private_subnets
}
