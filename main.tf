terraform {
  backend "s3" {
    bucket         = "oozou-test-task-terraform-state"
    key            = "terraform/state.tfstate"
    region         = "ap-south-1"  # Change if needed
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "oozou-test-task-terraform-state"    # Change to a unique bucket name
  acl    = "private"

  tags = {
    Name        = "TerraformState"
    Environment = "Dev"
  }
}