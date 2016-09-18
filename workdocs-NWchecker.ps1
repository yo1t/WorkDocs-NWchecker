# Set WiFi-SSID, you want to stop WorkDocs 
$ssid = "yo1-mobile"

# Set Checking interval for WiFi-SSID
$interval = 60


# Set Environment for WorkDocs
$WorkDocs = "\Programs\Amazon.com, Inc\Amazon WorkDocs.appref-ms"
$WorkDocsPath = [Environment]::GetFolderPath('StartMenu') + $WorkDocs
$WorkDocsProcessName = "AmazonWorkDocs"
$LogMessage = ""

# Main Process
while (1) {
    # Get now connect WiFi-SSID
    $netsh_ssid = netsh wlan show interface | Select-String "    SSID                   :"
    $now_ssid = $netsh_ssid -replace ".*: "
    
    # Get Now time for log
    $nowtime = Get-Date -Format "yyyy/MM/dd-HH:mm:ss"

    if ( $now_ssid -eq $ssid ) {
    　　　　# Process of Stop WorkDocs
        if ( ( Get-Process $WorkDocsProcessName -ErrorAction 0 )  ) {
            Stop-Process -name $WorkDocsProcessName -ErrorAction 0
        }
        $LogMessage = "Now SSID is " + $now_ssid +". WorkDocs stopped."

    } else {
        # Process of Start WorkDocs
        if ( ( Get-Process $WorkDocsProcessName -ErrorAction 0 )  ) {
            $LogMessage = "WorkDocs is still running."
        } else {
            Start-Process $WorkDocsPath
            $LogMessage = "Now SSID is " + $now_ssid +". WorkDocs is starting."
        }
    }

    # Oputput Log
    Write-Output ($nowtime + " " + $LogMessage)

    # Sleep for several seconds
    Start-Sleep -Seconds $interval
}

