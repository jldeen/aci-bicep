targetScope = 'subscription'

param rgName string

param location string

param name string

@description('MySQL server password')
@secure()
param databasePassword string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

module aci 'modules/createACI.bicep' = {
  scope: resourceGroup(rg.name)
  name: '${name}-aci'
  params: {
    administratorPassword: databasePassword
  }
}
