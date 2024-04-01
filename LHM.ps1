while ($true) {
# Указываем URL, откуда будем получать JSON данные
$url = "http://localhost:8085/data.json"
$hostname = "same HOSTNAME as in zabbix_agent2.conf"
$server = "server ip or dns"


# Получаем JSON данные из указанного URL
$jsonData = & curl -Uri 'http://localhost:8085/data.json' | Select-Object -Expand Content
& curl -Uri 'http://localhost:8085/data.json' | Select-Object -Expand Content > out.json

# Подготавливаем данные для отправки на сервер Zabbix
$itemKey = "ohm.json_data" # например, custom.json_data
$itemValue = $jsonData | ConvertFrom-Json
$cpuCore1Clock = $itemValue.Children[0].Children[1].Children[2].Children[1].Value
$cpuCore2Clock = $itemValue.Children[0].Children[1].Children[2].Children[2].Value
$cpuCore3Clock = $itemValue.Children[0].Children[1].Children[2].Children[3].Value
$cpuCore4Clock = $itemValue.Children[0].Children[1].Children[2].Children[4].Value
$cpuCore5Clock = $itemValue.Children[0].Children[1].Children[2].Children[5].Value
$cpuCore6Clock = $itemValue.Children[0].Children[1].Children[2].Children[6].Value

$cpuPowerPackage = $itemValue.Children[0].Children[1].Children[1].Children[0].Value

$cpuCore1Temp = $itemValue.Children[0].Children[1].Children[3].Children[0].Value
$cpuCore2Temp = $itemValue.Children[0].Children[1].Children[3].Children[1].Value
$cpuCore3Temp = $itemValue.Children[0].Children[1].Children[3].Children[2].Value
$cpuCore4Temp = $itemValue.Children[0].Children[1].Children[3].Children[3].Value
$cpuCore5Temp = $itemValue.Children[0].Children[1].Children[3].Children[4].Value
$cpuCore6Temp = $itemValue.Children[0].Children[1].Children[3].Children[5].Value
$cpuCoreMaxTemp = $itemValue.Children[0].Children[1].Children[3].Children[13].Value
$cpuCoreAvgTemp = $itemValue.Children[0].Children[1].Children[3].Children[14].Value
$cpuCoreTempPackage = $itemValue.Children[0].Children[1].Children[3].Children[6].Value

$gpuPowerPackage = $itemValue.Children[0].Children[3].Children[0].Children[0].Value
$gpuCoreClock = $itemValue.Children[0].Children[3].Children[1].Children[0].Value
$gpuCoreTemp = $itemValue.Children[0].Children[3].Children[2].Children[0].Value
$gpuHotSpotTemp = $itemValue.Children[0].Children[3].Children[2].Children[1].Value

$nvmeTemp = $itemValue.Children[0].Children[5].Children[0].Children[0].Value
function FilterString([string]$inputString) {
    $filteredString = $inputString -creplace "[^\d\.,]", "" -replace ",", "."
    return $filteredString
}
function Filtration([string]$inputString) {
    $filteredString = $inputString -creplace "[^\d\.,]", "" -replace ",", "."
    return $filteredString
}




& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore1Clock" -o $cpuCore1Clock
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore2Clock" -o $cpuCore2Clock
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore3Clock" -o $cpuCore3Clock
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore4Clock" -o $cpuCore4Clock
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore5Clock" -o $cpuCore5Clock
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore6Clock" -o $cpuCore6Clock

& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuPowerPackage" -o $cpuPowerPackage

& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore1Temp" -o $cpuCore1Temp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore2Temp" -o $cpuCore2Temp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore3Temp" -o $cpuCore3Temp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore4Temp" -o $cpuCore4Temp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore5Temp" -o $cpuCore5Temp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCore6Temp" -o $cpuCore6Temp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCoreMaxTemp" -o $cpuCoreMaxTemp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCoreAvgTemp" -o $cpuCoreAvgTemp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.cpuCoreTempPackage" -o $cpuCoreTempPackage

& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.gpuPowerPackage" -o $gpuPowerPackage
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.gpuCoreClock" -o $gpuCoreClock
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.gpuCoreTemp" -o $gpuCoreTemp
& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.gpuHotSpotTemp" -o $gpuHotSpotTemp

& "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe" -z $server -s $hostname -k "lhm.nvmeTemp" -o $nvmeTemp
Start-Sleep -Seconds 5
}