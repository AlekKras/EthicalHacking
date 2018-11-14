# OpenVas

If you are installing OpenVAS into an Ubuntu virtual machine I suggest adding as much CPU as you can as this will speed up your scan times. A suggested minimum is 8GB of RAM and 4 cores. An interesting new feature mentioned in the latest release is the development towards build a distributed system for large scale deployments. Having a central console (and manager) that can delegate scans to multiple scanners is an excellent architecture for those wanting to scan large numbers of targets.

## Install OpenVAS

You can either clone this repo and run `sudo bash install.sh` (that does a lot of stuff automatically) or perform the following (manually):

Firsltly, we will add the PPA repo to our Ubuntu build.

```
add-apt-repository ppa:mrazavi/openvas
apt update
apt install sqlite3
apt install openvas9
```

If you want to install additional packages (required for PDF reports to work) then you can do the following:

`apt install texlive-latex-extra --no-install-recommends`

If you like being fancy, definately run this:

`apt-get install texlive-fonts-recommended`


Finally, run the following:

```
apt install libopenvas9-dev
greenbone-nvt-sync
greenbone-scapdata-sync
greenbone-certdata-sync
```

Let's start the Open VAS scanner process, shall we? 

`service openvas-scanner restart`

You can always check running processes by running:

`ps -ef | grep openvas`


Obviously, if you like pen testing, then let's install the Microsoft SMB service for detecting things such as *MS17-010* and even *MS08-067*:

`apt install smbclient`

Go to your localhost port `4000`

## Getting started

You can expect to see something like this:

<img src="https://hackertarget.com/screenshots/openvas-login.png">


After completing the installation and logging into the system (The password and login is `admin` for both) you might be wondering of what to do. First of all, change the password! Secondly, keep reading this tutorial...

### Add a target

Using the web interface select **Configuration > Targets** to add a new target to scan. Note: ***the star icon in the top left corner is actually the "add" button***

### Add a task

Select **Scans > Tasks** to add a new task. For the scan, you would leave defaults and simply click to scan using the target you did previously.

### Start Scan

Click **play** and it will start scanning for you. Results can be found under **Scans > Reports**.

