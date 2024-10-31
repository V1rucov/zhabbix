$defenderStatus = Get-MpPreference

if ($defenderStatus.DisableRealtimeMonitoring -eq $true) {
    $defenderStatus = 1
} else {
    $defenderStatus = 0
}

$defenderStatus