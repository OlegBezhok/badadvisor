param environment string 
param resourcePostfix string

module storageAccount 'resources/storageAccount.bicep' = {
  name: 'storageAccount-deployment'
  params: {
    environment: environment
    subnetId:vNet.outputs.subnetId
  }
}

module appService 'resources/appService.bicep' = {
  name: 'appService-deployment'
  params: {
    environment: environment
    subnetId:vNet.outputs.subnetId
    vnetName:vNet.name
  }
}

module vNet 'resources/vnet.bicep' = {
  name: 'vnet-deployment'
  params: {
    environment: environment
    resourcePostfix: resourcePostfix
  }
}
