#### Direct/Reverse ssh-tunnel

##### Auto script to make ssh tunnel between 2 server with related system file and cronjob  (direct tunnel) and (reverse tunnel)
 - make system file
 - generate key and copy to 2nd server
 - create cronjob after every reboot to run the script



### ‼️ Direct SSH Tunnel Instruction ‼️ 
#### 👉 Click To View <details>

 - root previllage ( sudo -i )
 - update & upgrade server ( apt/yum update )
         
#### in your local (IRAN) VPS
##### Ubuntu & Debian
             
```
apt install shc && wget -4 -N https://raw.githubusercontent.com/opiran-club/ssh-tunnel/main/opiran-direct-ssh-tunnel && chmod +x opiran-direct-ssh-tunnel && ./opiran-direct-ssh-tunnel
```
##### Centos
```
yum install shc && wget -4 -N https://raw.githubusercontent.com/opiran-club/ssh-tunnel/main/opiran-direct-ssh-tunnel && chmod +x opiran-direct-ssh-tunnel && ./opiran-direct-ssh-tunnel
```
</details>



### ‼️ Reverse SSH Tunnel Instruction ‼️ 
<b> 👉 Click To View <b> <details>
  
 - root previllage ( sudo -i )
 - update & upgrade server ( apt/yum update )
 
#### 1) in your local (IRAN) VPS
```
echo "GatewayPorts yes" >> /etc/ssh/sshd_config && service ssh restart
```

#### 2) in your Remote (Kharej) VPS
##### Ubuntu & Debian

```
apt install shc && wget -4 -N https://raw.githubusercontent.com/opiran-club/ssh-tunnel/main/opiran-reverse-ssh-tunnel && chmod +x opiran-reverse-ssh-tunnel && ./opiran-reverse-ssh-tunnel
```
##### Centos
```
yum install shc && wget -4 -N https://raw.githubusercontent.com/opiran-club/ssh-tunnel/main/opiran-reverse-ssh-tunnel && chmod +x opiran-reverse-ssh-tunnel && ./opiran-reverse-ssh-tunnel
```
</details>


#
#

## Credits

credited by [OPIran](https://github.com/opiran-club)

## Contacts

[Telegram-Group](https://t,me/OPIranCluB)

[Telegram-Channel](https://t,me/opiranv2rayproxy)
           
#
#            
## Image Of Script

[<img src="https://img4.teletype.in/files/7a/37/7a3797d4-b5b5-439f-84eb-d5b4b6109110.jpeg" width="50%">](https://www.you-tech.win/)

[<img src="https://img3.teletype.in/files/a6/20/a620791f-0923-48a9-b4d5-f5d54cd53b51.jpeg" width="50%">](https://www.you-tech.win/)

[<img src="https://img1.teletype.in/files/01/70/017049f5-02b4-4721-a3f0-1da5cf7d23e8.jpeg" width="50%">](https://www.you-tech.win/)
#
#         
## 🎁 Donate OPIran

<details>
 
 
 <summary><p><b> 👉 Click To View <b>⚡️ 🎁 Donate to give away great projects 🎁</b></b></p></summary>
 
 ✅ USDT (ERC20)

🔗 Link : 
 ```

 ```
 
 ✅ TRX (TRC20)

🔗 Link : 
 ```

 ```
</details>
#
#
#

#
#



