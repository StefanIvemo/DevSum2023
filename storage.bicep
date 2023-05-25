@description('Specifies the location for resources.')
param location string = 'westeurope'
@maxLength(3)
param namePrefix string

var storageName = '${namePrefix}${uniqueString(resourceGroup().location)}'

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Premium_LRS'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
