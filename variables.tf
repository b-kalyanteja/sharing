variable "reg" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-east-1"
}
variable "cent" {
  description = "AMI ID of the Os - cent 7"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # CentOS 7 AMI ID
}

variable "ssh_key" {
  description = "name of keypair"
  default      = "abc" #create and get from aws

}

variable "file" {
  description = "path of privae key downloaded from aws"
  default     = "/path/to/private-key.pem"  # Default path to the private key file
}
