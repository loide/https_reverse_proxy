Prerequisites
-------------
- Vagrant 1.7 >
- VirtualBox

Build
-----
First, start VirtualBox and then:

$./deploy

It will create an vm running Jenkins behind Nginx.


Access
------
https://jenkins.domain.com


Note
----

Add the private IP and the server name from the vm to the host machine

sudo vi /etc/hosts

Add the following

192.168.68.8 jenkins.domain.com

Save and quit.

Also, be sure that you do not have another process using 443 or 8080 port on your host. If so, change on vangrantfile to another available port.
