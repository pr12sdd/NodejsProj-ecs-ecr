terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version="6.24.0"
    }
  }

  backend "s3"{
     bucket = "ecs-ecr-bucket5332"
     key = "terraform.tfstate"
     region = "us-east-2"
     dynamodb_table = "ecs_ecr_db"
  }
}