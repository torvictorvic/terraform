#Account ID
data "aws_caller_identity" "current" {}

#Local variables
locals {
    
    extra_template_variables = { 
        "db_endpoint"                   : "${module.db.db_instance_endpoint}",
        "db_database_name"              : "${var.database_name}",
        "account_id"                    : "${var.account_id}",
        "layer2"                        : "${var.layer2}",
        "stack_id"                      : "${var.stack_id}",
        "name3"                         : "${var.name3}"
    }  

    extra_template_variables2 = { 
        "db_endpoint"                   : "${module.db.db_instance_endpoint}",
        "db_database_name"              : "${var.database_name}",
        "account_id"                    : "${var.account_id}",
        "layer2"                        : "${var.layer_rad}",
        "stack_id"                      : "${var.stack_id}",
        "name3"                         : "${var.name3}"
    }  

}