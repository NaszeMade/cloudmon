param containerAppName string = 'cloudmon-remediator'
param location string = resourceGroup().location
param containerImage string = 'ghcr.io/username/remediator:latest'
param managedEnvName string = 'cloudmon-env'

resource managedEnv 'Microsoft.App/managedEnvironments@2022-03-01' existing = {
  name: managedEnvName
}

resource containerApp 'Microsoft.App/containerApps@2022-03-01' = {
  name: containerAppName
  location: location
  properties: {
    managedEnvironmentId: managedEnv.id
    configuration: {
      ingress: {
        external: true
        targetPort: 8080
      }
    }
    template: {
      containers: [
        {
          name: 'remediator'
          image: containerImage
        }
      ]
    }
  }
}
