@allowed([
  'dev'
  'prod'
])
param environment string

resource sqlDatabase 'Microsoft.Sql/servers@2021-05-01-preview' = {
  name: 'sqlbadadvisor${environment}ob'
  location: 'eastus'
  identity:{
    type: 'SystemAssigned'
  }
  properties: {
    administratorLogin: 'Admin'
    administratorLoginPassword: 'Admin'
    publicNetworkAccess: 'Enabled'
  }
}
