Direct ssh-tunnel

Auto script to make ssh tunnel between 2 server with related system file and cronjob  (direct tunnel)
 - make system file
 - generate key and copy to 2nd server
 - create cronjob after every reboot to run the script

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

!! INSTRUCTION !!
 - root previllage
 - update & upgrade server

```
apt update && apt install curl -y && bash <(curl -s https://raw.githubusercontent.com/opiran-club/ssh-tunnel/main/direct-tunnel.sh --ipv4)
```

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

credited by [OPIran](https://github.com/opiran-club)

[Telegram-Group](https://t,me/OPIranCluB)
[Telegram-Channel](https://t,me/opiranv2rayproxy)
