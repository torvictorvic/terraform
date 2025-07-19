#Databases

module "db" {
  source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/db/rds?ref=v2.6.16"

  stack_id = var.stack_id
  layer = var.layer2

  identifier = "${var.layer2}-${var.stack_id}"

  create_db_option_group    = false
  create_db_parameter_group = true
  create_security_group     = true

  engine               = var.engine
  engine_version       = var.engine_version
  family               = var.family  # DB parameter group
  major_engine_version = var.major_engine_version         # DB option group
  instance_class       = var.instance_class

  allocated_storage = var.allocated_storage
  storage_encrypted = var.storage_encrypted

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  name                   = var.database_name
  username               = var.username
  create_random_password = var.create_random_password
  random_password_length = var.random_password_length
  port                   = var.port

  multi_az               = var.multi_az
  //create_db_subnet_group = false
  vpc_id                 = module.network.vpc_id
  subnet_ids             = module.network.private_subnet_ids

  maintenance_window = var.maintenance_window
  backup_window      = var.backup_window
  enabled_cloudwatch_logs_exports =var.enabled_cloudwatch_logs_exports

  # Backups are required in order to create a replica
  backup_retention_period = var.backup_retention_period
  allowed_cidr_blocks = var.private_subnets

  skip_final_snapshot     = var.skip_final_snapshot
  deletion_protection     = var.deletion_protection
  publicly_accessible     = var.publicly_accessible
  apply_immediately       = var.apply_immediately
  tags = var.tags

  depends_on = [module.network]
}
