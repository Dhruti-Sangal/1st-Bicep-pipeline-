param storageAccountName string = 'storract8967'
param vmName string ='myvm8975'
param vnetName string = 'vnet8789'
param location string = resourceGroup().location
param adminUsername string = 'hellouser'


module storageAccountModule 'Modules/StorageAccount/sa.bicep' = {
  name: 'storageAccountModule'
  params: {
    location:location
    storageAccountName: storageAccountName
  }
}

module vnetModule 'Modules/VirtualNetwork/vnet.bicep' = {
  name: 'networkModule'
  params: {
    vnetName: vnetName
    location: location
  }
}

module vmModule 'Modules/VirtualMachine/vm.bicep' = {
  name: 'vmModule'
  params: {
    vmName: vmName
    //storageAccountId: storageAccountModule.outputs.storageAccountId
    vnetId: vnetModule.outputs.vnetId
    location: location
    adminUsername:adminUsername
  }
}

output vmId string = vmModule.outputs.vmId
output storageAccountId string = storageAccountModule.outputs.storageAccountId
output vnetId string = vnetModule.outputs.vnetId
