# Write up

Of course, you need to read `README` to get to `/levels` part.

Then, there are two ways to find the password: bruteforce or GDB debugging.

## GDB

You run `gdb -q ./level01 ` first, and you can find something interesting going on. Value `$0x10f,%eax` looks suspicious so you might want to traverse it back to decimal from HEX (because we can see push, callx2, and cmp - which might stand to compare). Doing it via shell we get `$((0x10f ))` that it's `271`

## Brute Force

Other way around is just a brute force. Just run `for i in $(seq -w 0 999); do echo $i; echo $i | ./level01 ; sleep 0.5; clear; done`

## Final

Once you are done, just run `cat /home/level2/.pass` and you will find a password `XNWFtWKWHhaaXoKI`. Disconnect and connect back as level2
