
resource "aws_db_instance" "this" {
  identifier                  = var.identifier
  allocated_storage           = var.allocated_storage
  db_name                     = var.db_name
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  manage_master_user_password = var.manage_master_user_password
  username                    = var.username
  parameter_group_name        = var.parameter_group_name
  availability_zone           = var.availability_zone
  db_subnet_group_name        = aws_db_subnet_group.subnet_group.name
  iops                        = var.iops
  password                    = var.password
  apply_immediately           = var.apply_immediately
  network_type                = var.network_type
  vpc_security_group_ids      = var.vpc_security_group_ids
  storage_type                = var.storage_type
  skip_final_snapshot         = var.skip_final_snapshot
  final_snapshot_identifier   = var.final_snapshot_identifier
  port                        = var.port
  multi_az = var.multi_az
  depends_on = [ aws_db_subnet_group.subnet_group]
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
  tags = {
    Name = var.db_subnet_group_name
  }
}



