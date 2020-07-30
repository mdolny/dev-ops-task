$data = Get-content -Path websites.json -Raw | ConvertFrom-Json

$array = $data.websites | select-string -pattern '\b(?:(?:https?|ftp|file)://|www\.|ftp\.)(?:\([-A-Z0-9+&@#/%=~_|$?!:,.]*\)|[-A-Z0-9+&@#/%=~_|$?!:,.])*(?:\([-A-Z0-9+&@#/%=~_|$?!:,.]*\)|[A-Z0-9+&@#/%=~_|$])' | % { $_.Matches } | % { $_.Value }

foreach($url in $array) {
    try {
        $request= [System.Net.WebRequest]::Create("$url")
        $response = $request.getResponse()
        
        if ($response.StatusCode -eq "200") {
            write-host "`n $url : is reachable `n" -ForegroundColor green 
        }
        else {
            write-host "`n $url is bad and don't work `n" ` -ForegroundColor red
        }
    } catch {
        write-host "`n $url : is not reachable `n" ` -ForegroundColor red
    }
}