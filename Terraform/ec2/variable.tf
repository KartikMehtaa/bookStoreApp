variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-02b8269d5e85954ef" # Linux
}
variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 10
}
variable "volume_type" {
  description = "Type of the EBS volume"
  type        = string
  default     = "gp2"
}
