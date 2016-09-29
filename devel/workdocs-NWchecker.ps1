# Define of argument parameter
param( $ssid, $t, $usbtether )

Write-Output( "WorkDocs-NWchecker ver.0.2.2" )
Write-Output( "(-t [interval(second)] -ssid [WiFi-SSID]) -interface [Ethernet device name of USB-tethering]")
Write-Output( "" )

# SET YOUR WiFi-SSID, you want to stop WorkDocs. 
if ( $ssid -eq $null ) {
    $ssid = "yo1-007"
}
Write-Output( "WiFi SSID    : " + $ssid )

# Set Checking interval for WiFi-SSID
$interval = 20
if ( ( $t -ge 3 ) -And ( $t -le 3600 ) ) { 
    $interval = $t
}
Write-Output( "Interval     : " + $interval )

# SET Ethernet device such as USB-tethering, you want to stop WorkDocs. 
if ( $usbtether -eq $null ) {
    $usbtether = "none"
}
Write-Output( "USB-Tethering: " + $usbtether )


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

function GetNowSSID() {
    if ( $Home.Contains( ":" ) ) {
        # for Windows
        $netsh_ssid = netsh wlan show interface | Select-String "    SSID                   :"
    } else {
        # for Mac OS X
        $netsh_ssid = /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | Select-String "           SSID:" 
    }
    return $netsh_ssid -replace ".*: "
}


function GetNowUSBTether( $check_int ) {
    $usbtether_status = ""
    if ( $Home.Contains( ":" ) ) {
        # for Windows
        $usbtether_status = [System.Net.NetworkInformation.NetworkInterface]::GetAllNetworkInterfaces() | where {$_.Name -eq $check_int } | Select-Object -ExpandProperty OperationalStatus
        
    } else {
        # for Mac OS X
        $int_status = ifconfig $check_int |  Select-String "status:" 
        if( $int_status.Contains( "Active" ) ) {
            $usbtether_status = "Up"
        }
    }
    return $usbtether_status
}




# Main Process
while (1) {
    # Get SSID of wifi that is currently connected.

    $now_ssid = GetNowSSID
    $now_USBtether_status = GetNowUSBTether( $usbtether )
    
    $LogMessage = "Now SSID is " + $now_ssid + ". "
    if ( $usbtether -ne "none" ) {
        $LogMessage = $LogMessage + "Now USB Tethering is " + $now_USBtether_status + ". "
    }
    $LogMessage = $LogMessage + $ManageProcess +": "

    # Get Now time for log
    $nowtime = Get-Date -Format "yyyy/MM/dd-HH:mm:ss"

    if ( ( $now_ssid -eq $ssid ) -Or ( $now_USBtether_status -eq "Up" ) ) {
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
