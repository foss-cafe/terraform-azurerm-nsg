module "nsg" {
  source              = "../.."
  name                = "terraform-test-nsg"
  location            = "East US"
  resource_group_name = "terraform-test"
}