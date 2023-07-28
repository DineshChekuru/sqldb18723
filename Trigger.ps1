az login --service-principal -u 'f55422ff-27d7-49e9-bac4-b2d08e348b1e' -p '51y8Q~Z65zXIl9VvlskSLdWF3wiqSnXgqH_yMb9f' --tenant 'd5d054a0-66ec-434f-88c2-0ac973a0dfb1'
$synapsetrigger = az synapse trigger list --workspace-name synprod | ConvertFrom-Json
              foreach ($syn in $synapsetrigger) {
              if($syn.name -eq "Triggerdev" -or $syn.name -eq "Triggersp"){
              az synapse trigger start --name $syn.name --workspace-name synprod
              }
              else{
              az synapse trigger stop --name $syn.name --workspace-name synprod
              }
              }
