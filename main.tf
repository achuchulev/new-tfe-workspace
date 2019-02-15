variable "token" {}
variable "oauth" {}
variable "organization" {}
variable "CO_team" {}
 
module "aws-workspace-test" {
  source            = "app.terraform.io/atanasc/addworkspace/tfe"
  version           = "0.0.3"
  workspace_type    = "repo"
  workspace_name    = "workspace-test"
  repo_working_dir  = ""
  tfe_team          = "${var.CO_team}"
  tfe_team_access   = "admin"
  token             = "${var.token}"
  oauth             = "${var.oauth}"
  tfe_organization  = "${var.organization}"
  #aws_account       = "navCore"
  vcs_repo_ident    = "achuchulev/tfe-aws-workspace"
}
module "var-workspace-test" {
  source = "./aws/workspace-test"
  region = "us-east-2"
  account = "618541241448"
  workspace_id = "${module.aws-workspace-test.tfe_repo_workspace_id}"
}
