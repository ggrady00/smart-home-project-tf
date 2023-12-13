resource "aws_dynamodb_table" "lighting" {
  name           = "Lighting"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"
  }

}

resource "aws_dynamodb_table" "heating" {
  name           = "heating"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"
  }

}