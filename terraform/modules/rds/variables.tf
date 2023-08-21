variable "identifier" {
  description = "identifier."
  type        = string
}

variable "allocated_storage" {
  type        = number
  description = "The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs."
}

variable "db_name" {
  type        = string
  description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance."
}

variable "engine" {
  type        = string
  description = "The database engine to use."
}


variable "engine_version" {
  type        = string
  description = "The engine version to use."
}

variable "instance_class" {
  type        = string
  description = "The instance type of the RDS instance."
}

variable "manage_master_user_password" {
  type        = bool
  description = "Set to true to allow RDS to manage the master user password in Secrets Manager."
}


variable "parameter_group_name" {
  type        = string
  description = "Name of the DB parameter group to associate."
}

variable "availability_zone" {
  description = "The AZ for the RDS instance."
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available."
  type        = string
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of io1. Can only be set when storage_type is io1 or gp3."
  type        = string
}

variable "username" {
  type        = string
  description = "."
}
variable "password" {
  description = "Password for the master DB user"
  type        = string
}

variable "network_type" {
  description = "The network type of the DB instance. Valid values: IPV4, DUAL."
  type        = string
  default     = "IPV4"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type        = list(string)
}

variable "skip_final_snapshot" {
  description = "skip final snapshot."
  type        = bool
}

variable "storage_type" {
  description = "final snapshot identifier."
  type        = string
}

variable "final_snapshot_identifier" {
  description = "final snapshot identifier."
  type        = bool
}

variable "subnet_ids" {
  description = "List of VPC security groups to associate."
  type        = list(string)
}

variable "apply_immediately" {
  type = bool
}

variable "multi_az" {
  type = bool
}

variable "port" {
  type        = number
  description = "."
}