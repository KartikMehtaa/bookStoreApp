variable "instance_types" {
  description = "Type of EC2 instance"
  type        = map(string)
  default = {
    ecommercekubenetes = "t2.medium",
    ecommerceworker1   = "t2.micro",
    ecommerceworker2   = "t2.micro"
  }
}
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-02b8269d5e85954ef" # Linux
}
variable "volume_size" {
  description = "Size of the EBS volume in GB"
  type        = number
  default     = 20
}
variable "volume_type" {
  description = "Type of the EBS volume"
  type        = string
  default     = "gp2"
}
