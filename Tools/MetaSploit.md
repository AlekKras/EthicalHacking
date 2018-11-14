# MetaSploit Tutorial

Go ahead and visit this [page](https://www.metasploit.com)

## Start the database service

```
service postgresql start
## if this is the first time you are running metasploit, run the following:

msfdb init

### start metasploit using msfconsole
msfconsole
```

You will meet something ![similar](https://i1.wp.com/jonathansblog.co.uk/wp-content/uploads/2014/08/metasploit-tutorial-for-beginners-1.png?w=971&ssl=1)

This is msfconsole. Msfconsole is the main command line interface to MetaSploit. There are other interfaces available – GUI interfaces (armitage), and a web interface too (websploit). With msfconsole you can launch exploits, create listeners, configure payloads etc.

## Getting help in metaploit

`help show`

and also

`help search`

>>> If you get the error ‘Database not connected or cache not built’ use ‘db_status’ to see if the metasploit database connected. if not, start the postgresql database (instructions above) and re-start msfconsole. If ‘db_status’ reports ‘connected’ then run the ‘db_rebuild_cache’ command to rebuild your metasploit database cache.

```
#rebuild the database caches
db_rebuild_cache
```

## Identify a remote host

You can run nmap from inside msfconsole and save the output into the MetoSploit db

`db_nmap -v -sV host_or_network_to_scan[eg 192.168.0.0/24]`

![Image](https://i0.wp.com/jonathansblog.co.uk/wp-content/uploads/2014/08/metasploit-tutorial-for-beginners-2.png?w=969&ssl=1)

Now, if we want to show a list of all available port scanners, we can do the following:

`search port-scan`

There are plenty of documentation articles to let you know about all possible port scans, so we won't focus on them much except the ones that I personally find useful:


#### SMB Version Scanning

You can run `use auxiliary/scanner/smb/smb_version` and perform the scan

#### Idle Scanning

Nmap’s IPID Idle scanning allows us to be a little stealthy scanning a target while spoofing the IP address of another host on the network. In order for this type of scan to work, we will need to locate a host that is idle on the network and uses IPID sequences of either Incremental or Broken Little-Endian Incremental. Metasploit contains the module scanner/ip/ipidseq to scan and look for a host that fits the requirements.

`msf > use auxiliary/scanner/ip/ipidseq`

## Pick a vulnerability and use an exploit

`search type:exploit search CVE-XXXX-XXXX search cve:2014 search name:wordpress`

You can go ahead and import the exploit and run it by configuring payloads and targets.
