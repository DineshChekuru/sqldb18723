﻿$synapsetrigger = az synapse trigger list --workspace-name synprod | ConvertFrom-Json
              foreach ($syn in $synapsetrigger) {
              if($syn.name -eq "Trigger"){
              az synapse trigger stop --name $syn.name --workspace-name synprod
              }
              }
              