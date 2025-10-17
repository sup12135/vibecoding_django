param location string = 'koreacentral'
param projectName string = 'memojjang'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: projectName + '-rg'
  location: location
}

resource sa 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: toLower('${projectName}sa')
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

// App Service Plan and Web App for Containers would be defined here
