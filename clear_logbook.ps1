$timeThreshold = (Get-Date).AddMinutes(-1)
$clear_logbook = Get-WinEvent -FilterHashtable @{
    LogName = "Security";
    ID = 1102;
    StartTime = $timeThreshold
} -ErrorAction SilentlyContinue

if ($clear_logbook.Count -and $clear_logbook.Count -gt 0) { Write-Output 1 } 
else { Write-Output 0 }