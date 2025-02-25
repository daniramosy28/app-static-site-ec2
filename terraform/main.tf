# MODULES ORCHESTRATOR

module "network" {
    source               = "./modules/network"
    vpc_cidr             = "${var.vpc_cidr}"
    vpc_az1              = "${var.vpc_az1}"
    vpc_az2              = "${var.vpc_az2}"
    vpc_sn_pub_az1_cidr  = "${var.vpc_sn_pub_az1_cidr}"
    vpc_sn_priv_az1_cidr = "${var.vpc_sn_priv_az1_cidr}"
}

module "compute" {
    source                   = "./modules/compute"
    ec2_lt_name              = "${var.ec2_lt_name}"
    ec2_lt_ami               = "${var.ec2_lt_ami}"
    ec2_lt_instance_type     = "${var.ec2_lt_instance_type}"
    ec2_lt_ssh_key_name      = "${var.ec2_lt_ssh_key_name}"
    ec2_lb_name              = "${var.ec2_lb_name}"
    ec2_lb_tg_name           = "${var.ec2_lb_tg_name}"
    ec2_asg_name             = "${var.ec2_asg_name}"
    ec2_asg_desired_capacity = "${var.ec2_asg_desired_capacity}"
    ec2_asg_min_size         = "${var.ec2_asg_min_size}"
    ec2_asg_max_size         = "${var.ec2_asg_max_size}"
    vpc_cidr                 = "${var.vpc_cidr}"
    vpc_id                   = "${module.network.vpc_id}"
    vpc_sn_pub_az1_id        = "${module.network.vpc_sn_pub_az1_id}"
    vpc_sg_pub_id            = "${module.network.vpc_sg_pub_id}"
    rds_endpoint             = "${module.database.rds_endpoint}"
    rds_dbuser               = "${var.rds_dbuser}"
    rds_dbpassword           = "${var.rds_dbpassword}"
    rds_dbname               = "${var.rds_dbname}"
}