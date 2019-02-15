resource "tfe_variable" "region" {
  key           = "region"
  value         = "${var.region}"
  category      = "terraform"
  workspace_id  = "${var.workspace_id}"
}
resource "tfe_variable" "account" {
  key           = "account"
  value         = "${var.account}"
  category      = "terraform"
  workspace_id  = "${var.workspace_id}"
}
