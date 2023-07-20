param
(
    [parameter(Mandatory = $true)] [String] $globalParametersFilePath,
    [parameter(Mandatory = $true)] [String] $resourceGroupName,
    [parameter(Mandatory = $true)] [String] $workspaceName
)
Import-Module Az.Synapse
$newGlobalParameters = New-Object 'system.collections.generic.dictionary[string,Microsoft.Azure.Management.Synapse.Models.GlobalParameterSpecification]'
Write-Host "Getting global parameters JSON from: " $globalParametersFilePath
$globalParametersJson = Get-Content $globalParametersFilePath
Write-Host "Parsing JSON..."
$globalParametersObject = [Newtonsoft.Json.Linq.JObject]::Parse($globalParametersJson)
foreach ($gp in $globalParametersObject.GetEnumerator()) {
    Write-Host "Adding global parameter:" $gp.Key
    $globalParameterValue = $gp.Value.ToObject([Microsoft.Azure.Management.Synapse.Models.GlobalParameterSpecification])
    $newGlobalParameters.Add($gp.Key, $globalParameterValue)
}
$dataFactory = Get-AzSynapseWorkspace -ResourceGroupName $resourceGroupName -Name $dataFactoryName
$dataFactory.GlobalParameters = $newGlobalParameters
Write-Host "Updating" $newGlobalParameters.Count "global parameters."
Set-AzDataFactoryV2 -InputObject $dataFactory -Force
