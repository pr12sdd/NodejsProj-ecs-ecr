resource "aws_s3_bucket" "mybucket" {
  bucket = "ecs-ecr-bucket5332"
  tags={
    Name="ecs-ecr-bucket5332"
  }
}