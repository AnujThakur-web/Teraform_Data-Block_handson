module "babu_rg" {
  source      = "../../modules/azurerm_resource_group"
  rg_name     = "babu_rg"
  rg_location = "centralindia"
}

module "babu_stg" {
  depends_on = [module.babu_rg]
  source     = "../../modules/azurerm_storage_account"
  stg_name   = "babustg25252"
  rg_name    = "babu_rg"
  location   = "centralindia"


}
 module "blob_container" {
    depends_on = [ module.babu_stg ]
    source = "../../modules/azurerm_storage_container"
    container_name = "terraformstet"
    storage_account_id = module.babu_stg.meri_id
   
 }



 