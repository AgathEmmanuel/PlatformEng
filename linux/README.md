# Linux




[https://techstoriesindia.in/2021/04/how-to-reduce-external-monitor-brightness-in-ubuntu-21-04/](https://techstoriesindia.in/2021/04/how-to-reduce-external-monitor-brightness-in-ubuntu-21-04/)  

How to Reduce External Monitor Brightness in Ubuntu 21.04 [ Solved ]  

Just Disable Wayland and switch back to Xorg. This lazy fix is for people who jusy want an easy and quick way to get back the functionality and not tinker with a lot of commands to make it work with wayland. Just follow the below commands.

How to disable Wayland in Ubuntu 21.04

    Open a Terminal ( Ctrl + Alt + T )
    Enter this command sudo gedit /etc/gdm3/custom.conf
    Find the line #WaylandEnable=false in the configuration file
    Remove the # from the above line – it should now read WaylandEnable=false.
    Save the file
    Reboot your system

[https://techstoriesindia.blogspot.com/2020/05/reduce-external-monitor-brightness-ubuntu-linux.html](https://techstoriesindia.blogspot.com/2020/05/reduce-external-monitor-brightness-ubuntu-linux.html)  


How to change External Monitor Brightness on Ubuntu Linux

    Open a Terminal ( Ctrl + Alt + T )
    Enter the command xrandr -q | grep " connected" and press Enter. Find the external monitor name displayed in this command's output. In my case, it is HDMI-1
    To change the brightness enter this command xrandr --output HDMI-1 --brightness 0.5 and press Enter. ( change the monitor name HDMI-1 with the one you have ). 




[https://askubuntu.com/questions/1003101/how-to-use-xrandr-gamma-for-gnome-night-light-like-usage](https://askubuntu.com/questions/1003101/how-to-use-xrandr-gamma-for-gnome-night-light-like-usage)  

How to use "xrandr --gamma" for Gnome "Night Light"-like usage?  


user can change the settings, a good starting point for full brightness setting is:

xrandr --output DP-1-1 --gamma 1:1:1 --brightness 1.0

The nighttime setting (for one of the three monitors) is:

xrandr --output DP-1-1 --gamma 1.0:0.88:0.76 --brightness 0.55

Note: Up to three monitors can be defined with separate settings.


explanation: --gamma blue:red:green

ex :

xrandr --output HDMI-1-1 --brightness 0.6 --gamma 1:.8:.8
xrandr --output eDP-1 --brightness 0.8 --gamma 1:.8:.8









nautilus --browser ~/some/directory  


[https://www.serverlab.ca/scripting-programming/using-git-show-to-view-contents-of-files/](https://www.serverlab.ca/scripting-programming/using-git-show-to-view-contents-of-files/)  

```
 git show <version>:<file>

The version can be a commit ID, tag, or even a branch name. The file must be the path to a file. For example, the following would output a contents of a file named internal/example/module.go file from a tagged commit called “release-23”.

git show release-23:internal/example/module.go


```



[https://stackoverflow.com/questions/15438915/git-diff-filtered-by-file-name](https://stackoverflow.com/questions/15438915/git-diff-filtered-by-file-name)  



```
File arguments to git diff need to be delimited by -- - try this:

find . -name <pattern> | xargs git diff --

xargs makes sure spaces, tabs, newlines, etc are handled correctly.

You could debug it with the --name-status argument to git diff. You could also try:

git diff --name-only | grep <pattern>

[edit] Try:

git diff --name-status -- `find . -name '<pattern>'`
ebg@taiyo(98)$ git diff --name-status -- `find . -name '*.scm'`
M       scheme/base/boolean.scm
M       surf/compiler/common.scm
M       surf/compiler/compile.scm
M       surf/compiler/expand.scm


```


[https://www.google.com/search?channel=fs&client=ubuntu&q=how+to+replace+a+word+in+all+files+in+a+directory+linux](https://www.google.com/search?channel=fs&client=ubuntu&q=how+to+replace+a+word+in+all+files+in+a+directory+linux)  



```

A variation that takes into account subdirectories (untested):

find /var/www -type f -exec sed -i 's/privelages/privileges/g' {} \;

This will find all files (not directories, specified by -type f) under /var/www, and perform a sed command to replace "privelages" with "privileges" on each file it finds.



```


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
