Function New-ToastNotification {
    Param($Sender,$Message)

    # Required parameters
    $AudioSource = "ms-winsoundevent:Notification.Default"
    $HeaderFormat = "ImageOnly" # Choose from "TitleOnly", "ImageOnly" or "ImageAndTitle"
    $Base64Image = "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"

    # Create an image file from base64 string and save to user temp location
    If ($Base64Image)
    {
        $ImageFile = "$env:Temp\Logo.png"
        [byte[]]$Bytes = [convert]::FromBase64String($Base64Image)
        [System.IO.File]::WriteAllBytes($ImageFile,$Bytes)
    }
 
    # Load some required namespaces
    $null = [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]
    $null = [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime]

    # Register the AppID in the registry for use with the Action Center, if required
    $app =  '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
    $AppID = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\\WindowsPowerShell\\v1.0\\powershell.exe"
    $RegPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings'

    if (!(Test-Path -Path "$RegPath\$AppId")) {
        $null = New-Item -Path "$RegPath\$AppId" -Force
        $null = New-ItemProperty -Path "$RegPath\$AppId" -Name 'ShowInActionCenter' -Value 1 -PropertyType 'DWORD'
    }

#Define the toast notification in XML format
[xml]$ToastTemplate = @"
<toast duration="long">
    <visual>
    <binding template="ToastGeneric">
        <text hint-style="title" hint-wrap="true">$Sender</text>
        <image id="1" src="$ImageFile" alt="$ImageFile"/>    
        <group>
            <subgroup>
                <text hint-style="bodyText" hint-wrap="true" >$Message</text>
            </subgroup>
        </group>
    </binding>
    </visual>
    <audio src="$AudioSource"/>
</toast>
"@
  
    # Load the notification into the required format
    $ToastXml = New-Object -TypeName Windows.Data.Xml.Dom.XmlDocument
    $ToastXml.LoadXml($ToastTemplate.OuterXml)

    # Display
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($app).Show($ToastXml)
}

$Sender = "Message from IT"
$Message = "Your system is queued for migration
`It will be auto restart post migration
`Post restart follow the SOP to complete the migration

Please connect with Service Desk for any help
"
#Sending Notifications
New-ToastNotification -Sender $Sender -Message $Message