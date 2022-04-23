# Linux



```

curl -X POST \
	'<cloud-function-url>/compile-gif?rate=10' \ 
	-H 'Content-Type: application/json' \ 
	-d '{
		"frames": [ 
			"frame1.png", 
			"frame2.png",
			"frame0.png",
			"frame4.png",
			"frame5.png",
			"frame6.png"
		]
	}'

```

```

sudo lsof -i -P -n | grep LISTEN
sudo netstat -tulpn | grep LISTEN
sudo ss -tulpn | grep LISTEN
sudo lsof -i:22 ## see a specific port such as 22 ##
sudo nmap -sTU -O IP-address-Here


sudo lsof -i -P -n
$ sudo lsof -i -P -n | grep LISTEN
$ doas lsof -i -P -n | grep LISTEN ### [OpenBSD] ###


less /etc/services



check the listening ports and applications with netstat as follows.

$ netstat -tulpn | grep LISTEN

The netstat command deprecated for some time on Linux. Therefore, you need to use the ss command as follows:
sudo ss -tulw
sudo ss -tulwn
sudo ss -tulwn | grep LISTEN



$ sudo nmap -sT -O localhost
$ sudo nmap -sU -O 192.168.2.13 ##[ list open UDP ports ]##
$ sudo nmap -sT -O 192.168.2.13 ##[ list open TCP ports ]##






```

> bashrc

```

set -o vi

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gpo='git push origin'
alias gpom='git push origin main'
alias gs='git status'
alias gb='git branch'
alias gl='git log'
alias gk='git checkout'
alias glgdo='git log --graph --decorate --oneline'
alias glg='git log --graph'
alias glgo='git log --graph --oneline'
alias glgd='git log --graph --decorate'

alias co='code'

export PATH=$PATH:/usr/local/go/bin

```






> commands

```

## To download and extract tar files in one command

wget -c http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz -O - | tar -xz  

wget option -O specifies a file to which the documents is written, and here we use -, meaning it will written to standard output and piped to tar and the tar flag -x enables extraction of archive files and -z decompresses, compressed archive files created by gzip.

To extract tar files to specific directory, /etc/nginx/ in this case, include use the -C flag as follows.

sudo wget -c http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz -O - | sudo tar -xz -C /etc/nginx/


sudo curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz | tar -xz 

sudo curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz | sudo tar -xz  -C /etc/nginx/

OR 

sudo curl http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.tar.gz && sudo tar -xzf GeoLite2-Country.tar.gz -C /etc/nginx/






```



> networking




> files















# Links  

[https://forum.snapcraft.io/t/vscode-not-starting-opening/29360/22](https://forum.snapcraft.io/t/vscode-not-starting-opening/29360/22)  
