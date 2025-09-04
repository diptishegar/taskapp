variable "region" {
  default = "us-east-1" # change to your region
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "bucket_name" {
  description = "Unique S3 bucket name"
}

variable "project_tag" {
  default = "taskapp"
}
