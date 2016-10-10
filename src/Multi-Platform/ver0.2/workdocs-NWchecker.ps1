# Define of argument parameter
param( $ssid, $t )

Write-Output( "WorkDocs-NWchecker ver.0.2   (-t [interval(second)] -ssid [WiFi-SSID])")

# CHANGE VALUE. SET YOUR WiFi-SSID, you want to stop WorkDocs. 
if ( $ssid -eq $null ) {
    $ssid = "yo1-007"
}
Write-Output( "WiFi SSID: " + $ssid )

# Set Checking interval for WiFi-SSID
$interval = 180
if ( ( $t -ge 3 ) -And ( $t -le 3600 ) ) { 
    $interval = $t
}
Write-Output( "Interval : " + $interval )

Write-Output( "-----" )

# Set Environment for WorkDocs
if ( $Home.Contains( ":" ) ) {
    # for Windows
    $WorkDocsPath = [Environment]::GetFolderPath('StartMenu') + "\Programs\Amazon.com, Inc\Amazon WorkDocs.appref-ms"
} else {
    # for Mac OS X
    $WorkDocsPath = "/Applications/Amazon WorkDocs.app"
}
$WorkDocsProcessName = "AmazonWorkDocs"
$LogMessage = ""

# function of start process
function StartProcessList {
    if ( $Home.Contains( ":" ) ) {
        # for Windows
        Start-Process $WorkDocsPath
    } else {
        # for Mac OS X
        open $WorkDocsPath
    }
}

# function of stop process
function StopProcessList {
    Stop-Process -name $WorkDocsProcessName
}

$ManageProcess = "WorkDocs" 


# Main Process
while (1) {
    # Get SSID of wifi that is currently connected.
    if ( $Home.Contains( ":" ) ) {
        # for Windows
        $netsh_ssid = netsh wlan show interface | Select-String "    SSID                   :"
    } else {
        # for Mac OS X
        $netsh_ssid = /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | Select-String "           SSID:" 
    }
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
