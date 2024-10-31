$timeThreshold = (Get-Date).AddMinutes(-1)

$events = Get-WinEvent -FilterHashtable @{
    LogName = "Security";
    ID = 4719;
    StartTime = $timeThreshold
} -ErrorAction SilentlyContinue

if ($events) {
    Write-Host "Audit policy changed:"
    foreach ($event in $filteredEvents) {
        Write-Host "TIME: $($event.TimeCreated)"
        Write-Host "USR: $($event.Properties[1].Value)"
        Write-Host "----------------------------------"
    }
} 
else {
    Write-Host "1"
}