# Security  


## Networking  


### Network Security Bible  




## CompTIA Pentest+  

DNS Recon  

```
# find who the owner of the domain or ip is, and gather more info  


nslookup itpro.tv  

dig itpro.tv  

host itpro.tv  


host -t ns itpro.tv  


# reverse lookup  

dig -h
man dig  # search reverse

dig -x ip-address

# check mail exchange

dig -t mx itpro.tv  


# zone transfer using dns  

dig axfr zonetransfer.me  
dig -t ns zonetransfer.me 

```

Target Recon  

```
sslscan itpro.tv

recon-ng

```


## Cryptography


## Steganography  




## Tools  
aircrack-ng  
ettercap    
wireshark  
john the ripper  
sql map  

## Equipments  


SATA to USB adapter Digital forensics analysis of HDDs and SSDs  
Huawei 4G wifi hotspot used as a router useful when port forwarding  
HackRF One is a software defined radio peripheral capable of transmission and reception of radio signals from  1 to 6 GHz  
Alfa Usb wifi adapter atheros AR9271 chipset capable of monitor mode used for wifi attacks  
Motorola Nexus 6 Android 7.1.1 kali linux nethunter build  
Usb Hardware keylogger Plug and play no drivers or installations records key strokes from connected keyboard  
kali linux  
Rubber Ducky  

## Ethical Hacking  

```
-payload : is a part of message,it can be part of malware which can
	   can destroy a system or can be used to create backdoor
	   in a system

-exploit : its like a hole in  a sytem that is ther is a 
	   valnerability in the system which can be used to 
	   attack the system

-valnerability : is a weakness in any system or network

-doxing  : means the public information available about us

-zero-day attack : consider a software which has some valnerability
		   and it gets attacked even before the day of
		   patching	

-daisy chaining : is like a chain like if i use some information to
		  attack a network and that same ingormation i use 
		  again to attack other networks

-botnet   :its an application or a software,its basically a 
	   compromised machine , consider we download something
	   from the internet and a malware also comes in with the
	   downloaded file and that malware creates a botnet in our
	   system and attackers use this compromised machines for 
	   doing there attacks


Hacking phases  
- Reconnaissance  
- Scanning  
- Gaining access  
- Maintaining access  
- Clear tracks  


```

## Wireless pentesting  

aircrack-ng            #tool used   
crunch                 #word list generator  

ifconfig wlo1 down             #wlo1 is the interface  name  
iwconfig wlo1 mode monitor     #put it in monitor mode  
ifconfig wlo1 up  
airmon-ng check wlo1           #check the interface for any process running  
airmon-ng check kill	       #repeat this untill all processes are killed  
airodump-ng wlo1 	       #this will start the scan  





## Certifications  
OSCP - Offensive Security Certified Professional  
OSWE - Offensive Security Web Expert  
OSCE - Offensive Security Certified Expert  
OSEE - Offensive Security Exploitation Expert  
OSWP - Offensive Security Wireless Professional  

## Courses  
PWK  - Penetration Testing With Kali linux  
AWAE - Advanced Web Attacks And Exploitation Web Application Security Training  
CTP  - Cracking the Perimeter  
AWE  - Advanced Windows Exploitation  
WIFU - Offensive Security Wireless Attacks  