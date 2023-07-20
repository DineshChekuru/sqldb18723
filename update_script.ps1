# Read the updated_config.json file
$UpdatedConfigPath = "./updated_config.json"
$UpdatedConfigContent = Get-Content -Path $UpdatedConfigPath | ConvertFrom-Json

# Set the updated environment variables from the updated configuration
$Env:workspaceName = $UpdatedConfigContent.parameters.workspaceName.value
$Env:AzureDataLakeStorage1_accountKey = $UpdatedConfigContent.parameters.AzureDataLakeStorage1_accountKey.value
$Env:syn1737_WorkspaceDefaultSqlServer_connectionString = $UpdatedConfigContent.parameters.syn1737_WorkspaceDefaultSqlServer_connectionString.value
$Env:AzureDataLakeStorage1_properties_typeProperties_url = $UpdatedConfigContent.parameters.AzureDataLakeStorage1_properties_typeProperties_url.value
$Env:AzureKeyVault1_properties_typeProperties_baseUrl = $UpdatedConfigContent.parameters.AzureKeyVault1_properties_typeProperties_baseUrl.value
$Env:syn1737_WorkspaceDefaultStorage_properties_typeProperties_url = $UpdatedConfigContent.parameters.syn1737_WorkspaceDefaultStorage_properties_typeProperties_url.value

# Rerun the workflow with the updated configuration values
Invoke-Expression -Command "Start-MyWorkflow"
