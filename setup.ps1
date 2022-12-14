$rgDevName = 'rg-ado-acr-sample-dev'
$acrNameDev = "acradosampledev"

$rgQaName = 'rg-ado-acr-sample-qa'
$acrNameQa = "acradosampleqa"

$servicePrincipalNameDev = "app-acr-ado-sample-dev"
$servicePrincipalNameQa = "app-acr-ado-sample-qa"

$location = 'germanywestcentral'

$rgDev = (az group create --name $rgDevName --location $location --query 'id')
$rgQa = (az group create --name $rgQaName --location $location --query 'id')

az acr create --name $acrNameDev --sku Basic --resource-group $rgDevName --location $location
az acr create --name $acrNameQa --sku Basic --resource-group $rgQaName --location $location

$spDev = (az ad sp create-for-rbac --name $servicePrincipalNameDev --role contributor --scopes $rgDev)
$spQa = (az ad sp create-for-rbac --name $servicePrincipalNameQa --role contributor --scopes $rgQa)
