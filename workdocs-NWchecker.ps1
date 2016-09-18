# CHANGE VALUE. SET YOUR WiFi-SSID, you want to stop WorkDocs. 
$ssid = "yo1-007"

# Set Checking interval for WiFi-SSID
$interval = 180

# Set Environment for WorkDocs
$WorkDocs = "\Programs\Amazon.com, Inc\Amazon WorkDocs.appref-ms"
$WorkDocsPath = [Environment]::GetFolderPath('StartMenu') + $WorkDocs
$WorkDocsProcessName = "AmazonWorkDocs"
$LogMessage = ""

# function of start process
function StartProcessList {
    Start-Process $WorkDocsPath
}

# function of stop process
function StopProcessList {
    Stop-Process -name $WorkDocsProcessName
}

$ManageProcess = "WorkDocs" 


# Main Process
while (1) {
    # Get SSID of wifi that is currently connected.
    $netsh_ssid = netsh wlan show interface | Select-String "    SSID                   :"
    $now_ssid = $netsh_ssid -replace ".*: "
    $LogMessage = "Now SSID is " + $now_ssid + ". " + $ManageProcess +": "

    # Get Now time for log
    $nowtime = Get-Date -Format "yyyy/MM/dd-HH:mm:ss"


    if ( $now_ssid -eq $ssid ) {
        # Process of Stop WorkDocs
        if ( ( Get-Process $WorkDocsProcessName -ErrorAction 0 )  ) {
            StopProcessList
            $logmessage = $logmessage + "try to stop."
        } else {
            $LogMessage = $LogMessage + "stopped."
        }

    } else {
        # Process of Start WorkDocs
        if ( ( Get-Process $WorkDocsProcessName -ErrorAction 0 )  ) {
            $LogMessage = $LogMessage + "still running."
        } else {
            StartProcessList
            $LogMessage = $LogMessage + "running."
        }
    }

    # Oputput Log
    Write-Output ($nowtime + " " + $LogMessage)

    # sleep for several seconds
    Start-Sleep -Seconds $interval
}
