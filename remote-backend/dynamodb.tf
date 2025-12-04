resource "aws_dynamodb_table" "mytable" {
  name="ecs_ecr_db"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name="LockID"
    type="S"
  }

  tags = {
    Name="ecs_ecr_db"
  }
}