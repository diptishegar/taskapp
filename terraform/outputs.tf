
output "ec2a_public_ip" {
  value = aws_instance.app.public_ip
}

output "ec2b_private_ip" {
  value = aws_instance.db.private_ip
}

output "ec2b_public_ip" {
  value = aws_instance.db.public_ip
}

output "s3_website_url" {
  value = aws_s3_bucket_website_configuration.frontend.website_endpoint
}




