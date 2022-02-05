# Linux


> bashrc

---

set -o vi

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gpo='git push origin'
alias gpom='git push origin main'
alias gs='git status'
alias gb='git branch'
alias gl='git log'



export PATH=$PATH:/usr/local/go/bin

---



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
