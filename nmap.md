# Nmap

If you want to exploit vulnerabilities and root boxes, you'll need to learn how to perform the necessary reconnaissance first.
In fact, you will spend far more time researching your target then you will exploiting it.

## Port Mapping

Any service running on a server, from HTTP to SSH, runs on ports. Think of a port as a door into and out of the computer,
that only answers requests relevant to it. An example would be a web server running on port 80 (HTTP), which would have no
idea how to handle an FTP connection request sent to it.

Nmap (Network Mapper) scans over those ports telling you everything from what software is running to what version it is.
There is even an option to determine the operating system.


## Getting Started

If you are using Linux (works for Debian/Centos), run:

`sudo apt-get install nmap && sudo yum install nmap`


## Things to remember


There is no doubting the sheer size of options here. Let's break it down with what scan techniques are the most useful for us right away.

| Flag | Description |
| :---: | :--- |
| `-sU` | UDP scan. Tends to be slower than TCP scans, but some services are only listening for UDP requests |
| `-sS` | SYN scan. SYN/ACK indicates the port is listening (open), while a RST (reset) means it's not listening on that port |
| `-O` | Crafts raw packets attempting to determine the operating system |
| `-A` | Probes for software versions on the target ports and OSs |

## Nmap in Action

Run `sudo nmap -sS -O $TARGET` where `$TARGET` is your desired webserver.

Here, we need to understand:

*Open Ports*

Your server might be actively accepting TCP connections, UDP datagrams or SCTP associations on the port. Finding these is often the primary goal of port scanning. Security-minded people know that each open port is an avenue for attack. Attackers and pen-testers want to exploit the open ports, while administrators try to close or protect them with firewalls without thwarting legitimate users. Open ports are also interesting for non-security scans because they show services available for use on the network.

*Closed Ports*

 A closed port is accessible, but there is no application listening on it (might be in your case). They can be helpful in showing that a host is up on an IP address (host discovery or ping scanning), and as part of OS detection. Because closed ports are reachable, it may be worth scanning later in case some open up.

 If you prefer to do it just with ports, you can run

 `sudo nmap -sT $TARGET`

To find out the operation system, you can run:

`sudo nmap -O $TARGET`

When you use nmap to scan a system or network, by default, it send out a ping to see if the host is up and if it gets a response, it then sends the specified packets to scan the system. If the ping is blocked or dropped, nmap gives up and says, "host is down."

To get around firewalls and routers that block or drop the ping, we need to suppress nmap's default behavior of sending out that initial ping and get past the firewall that is blocking us. We can do this by using the -P0 switch:

`sudo nmap -sS -P0 $TARGET`


If you want to gather version info, you can run:

`sudo nmap -V $TARGET`

## Reason

Nmap has a switch that will return the reason why it has placed a particular port in a particular state. For instance, we can run the same UDP scan as above with the `--reason` switch and nmap will return the same results, but this time will give us the reason it has determined the particular state of the port.

`sudo nmap -sU --reason $TARGET`

## list

Imagine you have a ton of webservers you want to go through? Well, you can create a txt file and nmap will do that for you!

`sudo nmap -iL $FILE.TXT`

## Output

Add `oN` switch so you will be able to output everything to the file

`sudo nmap -sS $TARGET -oN $FILE.TXT`


## Heartbleed

Put <a href="https://svn.nmap.org/nmap/scripts/ssl-heartbleed.nse">this</a> to the directory **`usr/share/nmap/scripts`**

Put <a href="https://svn.nmap.org/nmap/nselib/tls.lua">this</a> to the directory **`usr/share/nmap/nselib`**

Now you can run this against webservers:

`sudo nmap -sV --script=ssl-heartbleed $TARGET`
