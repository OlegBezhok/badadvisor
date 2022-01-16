@allowed([
  'dev'
  'prod'
])
param environment string
param subnetId string

resource sqlDatabase 'Microsoft.Sql/servers@2021-05-01-preview' = {
  name: 'sqlbadadvisor${environment}ob'
  location: 'eastus'
  identity:{
    type: 'SystemAssigned'
  }
  properties: {
    ignoreMissingVnetServiceEndpoint: true
    virtualNetworkSubnetId: subnetId
    administratorLogin:'TestLoginAdmin'
    administratorLoginPassword:'TestPassword!1'
  }
}
