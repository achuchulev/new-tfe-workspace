variable "token" {}
variable "oauth" {}
variable "organization" {}
variable "CO_team" {}

module "aws-navCore-workspace-test" {
  source            = "app.terraform.io/NavicoCloudTeam/workspace-aws/tfe"
  version           = "0.1.5"
  workspace_type    = "repo"
  workspace_name    = "navCore-workspace-test"
  repo_working_dir  = "use1/inf/dev/networking"
  tfe_team          = "${var.CO_team}"
  tfe_team_access   = "admin"
  token             = "${var.token}"
  oauth             = "${var.oauth}"
  tfe_organization  = "${var.organization}"
  aws_account       = "navCore"
  vcs_repo_ident    = "CO/navcore"
}
module "var-navCore-workspace-test" {
  source = "./aws/navCore-workspace-test"
  region = "us-east-1"
  account = "717547922293"
  workspace_id = "${module.aws-navCore-workspace-test.tfe_repo_workspace_id}"
}
