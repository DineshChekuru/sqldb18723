$synapsetrigger = az synapse trigger list --workspace-name synprod | ConvertFrom-Json
              foreach ($syn in $synapsetrigger) {
              if($syn.name -eq "Triggerdev" -or $syn.name -eq "Triggersp"){
              az synapse trigger stop --name $syn.name --workspace-name synprod
              }
              else{
              az synapse trigger start --name $syn.name --workspace-name synprod
              }
              }
