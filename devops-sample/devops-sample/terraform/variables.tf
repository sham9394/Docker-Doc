variable "aws_region" { default = "us-east-1" }
variable "instance_type" { default = "t3.micro" }
variable "ami" {
  description = "AMI ID for the region (Linux/Ubuntu)"
  default     = "ami-0c02fb55956c7d316"
}
variable "key_name" {
  description = "Existing AWS key pair name"
}
