variable "vpc_id" {
  description = "ID VPC."
}

variable "name_security_group" {
  description = "Name of the security group"
  type        = string
}

variable "ingress_rules" {
  description = "ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    security_groups = list(string)
    description = string
  }))
}

variable "egress_rules" {
  description = "egress rules"
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = list(string)
    security_groups = list(string)
    description     = string
  }))
}
