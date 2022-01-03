@allowed([
  'dev'
  'prod'
])
param environment string

var planName = 'plan-badadvisor-${environment}'
var webSiteName = toLower('wapp-badadviser-ob-${environment}')

resource plan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: planName
  location: resourceGroup().location
  sku: {
    tier: 'Free'
    name: 'F1'
  }
  kind: 'linux'
  properties: {
    maximumElasticWorkerCount: 1
    reserved: true
  }
}

resource appservice 'Microsoft.Web/sites@2021-02-01'= {
  name: webSiteName
  location: resourceGroup().location
  properties: {
    serverFarmId: plan.id
    enabled: true
    siteConfig: {
        netFrameworkVersion: 'v5.0'
    }
  }
  identity:{
    type: 'SystemAssigned'
  }
}
