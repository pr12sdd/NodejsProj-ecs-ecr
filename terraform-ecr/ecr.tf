terraform {
    required_providers {
      aws={
        source = "hashicorp/aws"
        version="6.24.0"
      }
    }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "myecr" {
    repository_name = "nodejsproj"
    catalog_data {
      description = "Repository for nodejsproj"
      architectures = ["x86_64", "ARM64","ARM","x86"]
      operating_systems = ["Linux"]

    }
    
}

output "aws_ecr_url" {
    value = aws_ecrpublic_repository.myecr.repository_uri
}
