# Zabbix-LibreHardwareMonitor-agent
Zabbix template, a powershell script for sending values from Libre Hardware Monitor (Open Hardware Monitor) to the server using Zabbix Agent 2 (active)

My way to collect and send sensor data using LHM (OHM) to a zabbix server

Guide:
1. You need to install LibreHardwareMonitor (OpenHardware Monitor) on your computer, turn on the web server on it:
![image](https://github.com/vasmarfas/Zabbix-LibreHardwareMonitor-agent/assets/37144504/613ea863-88ec-4650-a05d-64d9e64952c9)
2. To make sure that the server is running, copy/paste this link to your browser <a href="localhost:8085/data.json">localhost:8085/data.json</a>. You will see an output similar to this:
![image](https://github.com/vasmarfas/Zabbix-LibreHardwareMonitor-agent/assets/37144504/1b2c45de-ac33-47fe-80de-84374800491d)
3. Now you need to download LHM.ps1, change your $hostname and $server in it and add it to the startup/task scheduler. If your zabbix-sender.exe location is different from "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe", you should change it too
4. And finally, import the LibreHardwareMonitor template.yaml to the server

Important note! I was making this bundle of script+ template for my laptop with 6 CPU cores, video card and NVMe. Your configuration may differ, and the data format in data.json will differ accordingly. If the values are incorrect (and they are likely to be incorrect on systems other than mine), you should check the schema of the data returned by LHM(OHM) localhost:8085/data.json and make appropriate changes to the script and template. I tried to make the code simple, I think you can handle it

Good luck!
