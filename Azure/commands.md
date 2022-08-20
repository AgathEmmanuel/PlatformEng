

# Powershell  

```
Get-Module -Name Az -ListAvailable  		# List all current sdk s that had already got installed  

Update-Module -Name Az 				# to update to latest version  

Connect-AzAccount				# to connect log into azure from local  






New-AzResourceGroupDeployment
   [-Name <String>]
   -ResourceGroupName <String>
   [-Mode <DeploymentMode>]
   [-DeploymentDebugLogLevel <String>]
   [-RollbackToLastDeployment]
   [-RollBackDeploymentName <String>]
   [-Tag <Hashtable>]
   [-WhatIfResultFormat <WhatIfResultFormat>]
   [-WhatIfExcludeChangeType <String[]>]
   [-Force]
   [-ProceedIfNoChange]
   [-AsJob]
   [-QueryString <String>]
   -TemplateFile <String>
   [-SkipTemplateParameterPrompt]
   [-Pre]
   [-DefaultProfile <IAzureContextContainer>]
   [-WhatIf]
   [-Confirm]
   [<CommonParameters>]  



New-AzResourceGroup
   [-Name] <String>
   [-Location] <String>
   [-Tag <Hashtable>]
   [-Force]
   [-ApiVersion <String>]
   [-Pre]
   [-DefaultProfile <IAzureContextContainer>]
   [-WhatIf]
   [-Confirm]
   [<CommonParameters>]



New-AzVM
   [[-ResourceGroupName] <String>]
   [[-Location] <String>]
   [-EdgeZone <String>]
   [[-Zone] <String[]>]
   -Name <String>
   -Credential <PSCredential>
   [-NetworkInterfaceDeleteOption <String>]
   [-VirtualNetworkName <String>]
   [-AddressPrefix <String>]
   [-SubnetName <String>]
   [-SubnetAddressPrefix <String>]
   [-PublicIpAddressName <String>]
   [-DomainNameLabel <String>]
   [-AllocationMethod <String>]
   [-SecurityGroupName <String>]
   [-OpenPorts <Int32[]>]
   [-Image <String>]
   [-Size <String>]
   [-AvailabilitySetName <String>]
   [-SystemAssignedIdentity]
   [-UserAssignedIdentity <String>]
   [-AsJob]
   [-OSDiskDeleteOption <String>]
   [-DataDiskSizeInGb <Int32[]>]
   [-DataDiskDeleteOption <String>]
   [-EnableUltraSSD]
   [-ProximityPlacementGroupId <String>]
   [-HostId <String>]
   [-VmssId <String>]
   [-Priority <String>]
   [-EvictionPolicy <String>]
   [-MaxPrice <Double>]
   [-EncryptionAtHost]
   [-HostGroupId <String>]
   [-SshKeyName <String>]
   [-GenerateSshKey]
   [-CapacityReservationGroupId <String>]
   [-UserData <String>]
   [-ImageReferenceId <String>]
   [-PlatformFaultDomain <Int32>]
   [-HibernationEnabled]
   [-vCPUCountAvailable <Int32>]
   [-vCPUCountPerCore <Int32>]
   [-DefaultProfile <IAzureContextContainer>]
   [-WhatIf]
   [-Confirm]
   [<CommonParameters>]



Connect-AzAccount
       [-Environment <String>]
       [-Tenant <String>]
       [-AccountId <String>]
       [-Subscription <String>]
       [-AuthScope <String>]
       [-ContextName <String>]
       [-SkipContextPopulation]
       [-MaxContextPopulation <Int32>]
       [-UseDeviceAuthentication]
       [-Force]
       [-Scope <ContextModificationScope>]
       [-DefaultProfile <IAzureContextContainer>]
       [-WhatIf]
       [-Confirm]
       [<CommonParameters>]


Get-Command -Verb Get -Noun AzVM* -Module Az.Compute




New-AzWebApp
   [[-ResourceGroupName] <String>]
   [-Name] <String>
   [[-Location] <String>]
   [[-AppServicePlan] <String>]
   [-ContainerImageName <String>]
   [-EnableContainerContinuousDeployment]
   [-AsJob]
   [-GitRepositoryPath <String>]
   [-DefaultProfile <IAzureContextContainer>]
   [-WhatIf]
   [-Confirm]
   [<CommonParameters>]



New-AzAppServicePlan
   [-Location] <String>
   [[-Tier] <String>]
   [[-NumberofWorkers] <Int32>]
   [[-WorkerSize] <String>]
   [[-AseName] <String>]
   [[-AseResourceGroupName] <String>]
   [[-AseResourceId] <String>]
   [-PerSiteScaling <Boolean>]
   [-HyperV]
   [-AsJob]
   [-Tag <Hashtable>]
   [-Linux]
   [-ResourceGroupName] <String>
   [-Name] <String>
   [-DefaultProfile <IAzureContextContainer>]
   [<CommonParameters>]




```


AZ CLI  
```

az group create -l westus -n MyResourceGroup

az group create --location
                --name
                [--managed-by]
                [--tags]




az appservice plan create --name
                          --resource-group
                          [--app-service-environment]
                          [--hyper-v]
                          [--is-linux]
                          [--location]
                          [--no-wait]
                          [--number-of-workers]
                          [--per-site-scaling]
                          [--sku {B1, B2, B3, D1, F1, FREE, I1, I1v2, I2, I2v2, I3, I3v2, P1V2, P1V3, P2V2, P2V3, P3V2, P3V3, S1, S2, S3, SHARED, WS1, WS2, WS3}]
                          [--tags]
                          [--zone-redundant]





az webapp up [--app-service-environment]
             [--dryrun]
             [--html]
             [--ids]
             [--launch-browser]
             [--location]
             [--logs]
             [--name]
             [--os-type {Linux, Windows}]
             [--plan]
             [--resource-group]
             [--runtime]
             [--sku {B1, B2, B3, D1, F1, FREE, I1, I1v2, I2, I2v2, I3, I3v2, P1V2, P1V3, P2V2, P2V3, P3V2, P3V3, S1, S2, S3, SHARED, WS1, WS2, WS3}]





az webapp log download  


az acr import 		#import base images and other public content to your Azure container registry




az acr build --registry $ACR_NAME --image hiworld:v1 .		
			#az acr build is an ACR Task which queues a quick build, 
			providing streaming logs for an Azure Container 
			perform docker build and pushes result image to ACR  





az functionapp create --name $functionApp --storage-account $storage --consumption-plan-location "$location" --resource-group $resourceGroup --functions-version $functionsVersion



func
func init
func new

func start 
func start &> ~/logout.txt &


func azure functionapp publish "name of the funcion"










```
