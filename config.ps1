cd sqldb18723
$E = [System.Collections.ArrayList]@()
            $E = Get-Content -Path ./dev/notebook/CDS_Raw_daily.json
            $E = $E -replace "https://syn-tccc-mad-use2-dev-01.dev.azuresynapse.net/livyApi/versions/2019-11-01-preview/sparkPools/apsmaddev01", "https://syn-tccc-mad-use20-dev-01.dev.azuresynapse.net/livyApi/versions/2019-11-01-preview/sparkPool/apsmaddev01"
            $E = $E -replace "apsmaddev01", "prod0198"
            $E | Set-Content -Path ./dev/notebook/CDS_Raw_daily.json
