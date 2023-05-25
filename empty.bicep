param name string
param location string

var adminUserEnabled = true

@description('Generated from /subscriptions/30247484-29d4-4b25-b07a-4357febd372e/resourceGroups/devsum-rg/providers/Microsoft.ContainerRegistry/registries/devsum2023acr')
resource devsumacr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  sku: {
    name: 'Standard'
  }
  name: name
  location: location
  tags: {}
  properties: {
    adminUserEnabled: adminUserEnabled
    policies: {
      quarantinePolicy: {
        status: 'disabled'
      }
      trustPolicy: {
        type: 'Notary'
        status: 'disabled'
      }
      retentionPolicy: {
        days: 7
        status: 'disabled'
      }
      exportPolicy: {
        status: 'enabled'
      }
      azureADAuthenticationAsArmPolicy: {
        status: 'enabled'
      }
      softDeletePolicy: {
        retentionDays: 7
        status: 'disabled'
      }
    }
    encryption: {
      status: 'disabled'
    }
    dataEndpointEnabled: false
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: false
  }
}

output loginServer string = devsumacr.properties.loginServer
