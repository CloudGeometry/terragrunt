remote_state {
  backend = "local"
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    path = "foo.tfstate"
  }
  encryption = {
    key_provider = "pbkdf2"
    passphrase   = "correct-horse-battery-staple"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

inputs = {
  aws_region = "us-east-1"
}
