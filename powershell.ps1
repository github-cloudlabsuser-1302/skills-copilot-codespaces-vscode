param (
    [string]$ResourceGroupName,
    [string]$StorageAccountName,
    [string]$Location = "EastUS",
    [string]$SkuName = "Standard_LRS"
)

# Login to Azure
Connect-AzAccount

# Create the resource group if it doesn't exist
$resourceGroup = Get-AzResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    $resourceGroup = New-AzResourceGroup -Name $ResourceGroupName -Location $Location
}

# Create the storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName `
    -Name $StorageAccountName `
    -Location $Location `
    -SkuName $SkuName `
    -Kind StorageV2

Write-Output "Storage account '$StorageAccountName' created successfully in resource group '$ResourceGroupName'."