# Pentest plan

Reconnaissance is probably by far the most important thing to do before exploiting anything.

## Step 1: Passive Reconnaissance

There are essentially two tools that are needed:
- (Netcraft)[https://www.netcraft.com/]
- Maltego
- (Databases)[https://www.exploit-db.com/google-hacking-database]
- (crt)[https://crt.sh]

I recommend running Maltego first to see the structure of the entire network and then
look specifically at Netcraft per each of the hostnames.

#### Maltego

- Find a breach;

Go and find emails associated with the domain;
For all of emails run `haveibeenpwned`;
`Get all breaches of an email address`;

#### Crt

- Find domain names;

Go to (this)[https://crt.sh] page and type
`%.TARGET`

#### Dig

`dig A TARGET +short @8.8.8.8`

## Step 2: Active Reconnaissance

#### Nmap

`nmap -sS -T1 -P0 TARGET`

Important to note:
- `-sS` - SYN packets;
- `-T1` - slow speed;
- `-P0` - suppress ping;
