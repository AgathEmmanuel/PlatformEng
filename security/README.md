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





## Continous Pentesting / Continuous Attack Surface Penetration Testing (CASPT)  

- [https://www.youtube.com/live/H6x8l86sqiQ?si=jxiY0bV6MyGqc6WM](Integrating Security into CI/CD Pipelines) 
- [https://youtu.be/mZoOnWjv_QM?si=aXwoAzzqZ6UVUxf3](How to Create a DevSecOps CI/CD Pipeline)


```
Integrating penetration testing into the CI/CD pipeline, known as continuous penetration testing, helps identify and address vulnerabilities early in the development process, improving security and reducing costs. This involves automating pen tests, often using tools, to analyze code and applications for security flaws. 
Here's how penetration testing fits into CI/CD:

- Automated Testing:
CI/CD pipelines can include automated pen tests, which can be triggered with every code change or build. 
- Real-Time Vulnerability Detection:
These automated tests identify potential vulnerabilities in real-time, allowing for immediate remediation. 
- Early Remediation:
Addressing vulnerabilities early in the development lifecycle is less costly and time-consuming than fixing them later. 
- Security Gates:
Penetration test results can be used to create security gates in the CI/CD pipeline, blocking deployments if critical vulnerabilities are found. 
- Continuous Improvement:
Regular pen testing provides ongoing feedback, helping to refine security practices and improve the overall security posture. 

Benefits of Integrating Pen Testing:

- Reduced Technical Debt:
Catching vulnerabilities early reduces the need for costly code rewrites or patches later. 

- Improved Security Posture:
Regular pen testing helps to ensure that applications are secure and resilient to various attacks. 
- Faster Remediation:
Identifying vulnerabilities early allows for faster remediation and reduces the risk of breaches. 
- Enhanced Confidence:
Teams can build with confidence knowing that their applications are being thoroughly tested for security flaws. 

Examples of Tools and Approaches:

SAST (Static Application Security Testing): Analyzes source code for vulnerabilities before runtime. 
DAST (Dynamic Application Security Testing): Tests the application in its running state to identify vulnerabilities that may not be apparent during static analysis. 
RASP (Runtime Application Self-Protection): Provides continuous monitoring and protection for applications in production, responding to threats in real-time. 
OWASP ZAP: An open-source web application security testing tool that can be automated. 
AI-powered Pen Testing: Some tools utilize AI to automate and analyze penetration tests. 

In summary, integrating penetration testing into CI/CD is a crucial step in ensuring secure software development and deployment. 




How CASPT is Applied Across Different Assets

Continuous Attack Surface Penetration Testing can be applied across a variety of digital assets, including:

    Web Applications: Continuous testing of web applications helps in identifying vulnerabilities like SQL injection, cross-site scripting (XSS), and broken authentication mechanisms. Automated tools can scan for known vulnerabilities, while manual testing can uncover complex logic flaws that automated tools might miss.
    APIs: As APIs become more prevalent, they present an increasing attack surface. API Penetration Testing ensures that they are secure against common threats such as API key leaks, broken object level authorization, and injection attacks.
    Cloud Environments: Cloud security is critical as more organizations move to cloud-based infrastructure. Continuous penetration testing in the cloud involves checking configurations, access controls, and potential vulnerabilities in cloud services to prevent unauthorized access and data breaches.
    Networks: Network security is a foundational aspect of any organization's security posture. Continuous penetration testing of networks involves scanning for open ports, misconfigured firewalls, and outdated software that could be exploited by attackers.
    Mobile Applications: With the proliferation of mobile apps, securing them is crucial. Continuous penetration testing for mobile apps focuses on vulnerabilities specific to mobile environments, such as insecure data storage, improper session handling, and weak encryption.


```

[https://blog.ethiack.com/blog/catch-them-early-integrate-automated-pentesting-in-your-ci/cd-pipeline](https://blog.ethiack.com/blog/catch-them-early-integrate-automated-pentesting-in-your-ci/cd-pipeline)  
[https://purplesec.us/learn/continuous-penetration-testing/](https://purplesec.us/learn/continuous-penetration-testing/)  
[https://thehackernews.com/2024/08/the-facts-about-continuous-penetration.html](https://thehackernews.com/2024/08/the-facts-about-continuous-penetration.html)  


[https://youtu.be/5MjFafbpkEA?si=K-u6ycSGknGQVEwI](https://youtu.be/5MjFafbpkEA?si=LSR4_KVygJj4Jj8P)  


```
🔍 1. Nmap Scan — Reconnaissance and Vulnerability Surface Detection
🔧 What It Does:

    Performs port scanning: Finds open ports like 22 (SSH), 80 (HTTP), 443 (HTTPS), etc.

    Service detection: Identifies what software is running (e.g., Apache 2.4.49 on port 80).

    Optionally OS fingerprinting: Guesses the underlying operating system.

    Scans for known misconfigurations or exposure of services.

🧪 Why in CI/CD:

    Helps detect unexpected services or ports that were exposed due to a misconfigured deployment.

    Example finding:

    PORT    STATE SERVICE VERSION
    22/tcp  open  ssh     OpenSSH 8.2p1
    3306/tcp open mysql   MySQL 5.7.30 (unauthenticated)

This immediately raises a flag if, say, MySQL is exposed to the internet, which is a critical misconfiguration.
💣 2. Metasploit Scan — Active Exploitation Attempts
🔧 What It Does:

    Launches known exploits or auxiliary modules to:

        Brute-force or fuzz services.

        Attempt RCE (Remote Code Execution).

        Use auxiliary scanners to look for:

            SQL injection vulnerabilities

            Directory traversal

            Exposed admin panels

            Default passwords

Example Modules:

use auxiliary/scanner/http/dir_scanner
set RHOSTS your.target
run

This might reveal:

/admin
/login.php
/.env

Or it might use:

use exploit/unix/webapp/wp_admin_shell_upload

...to simulate an exploit on outdated WordPress.
🧪 Why in CI/CD:

    You automate real-world attacker behavior as part of QA.

    It simulates "what a hacker would do" to your environment and flags critical paths.

    Can fail builds if critical exploit paths are found.
    



🔐 1. Security Scan Stage - Tools Integration
🛠 Nmap Integration

stages:
  - build
  - test
  - security_scan

nmap_scan:
  stage: security_scan
  image: instrumentisto/nmap
  script:
    - TARGET_URL="your.staging.service.com"
    - nmap -sS -sV -oN nmap_report.txt $TARGET_URL
  artifacts:
    paths:
      - nmap_report.txt

    This does a TCP SYN scan with version detection. You can parse results using a regex or XML parser in next steps.

💣 Metasploit Integration (via msfconsole or msfrpcd)

Set up a container or VM runner with Metasploit Framework pre-installed.

metasploit_scan:
  stage: security_scan
  image: custom/metasploit-runner:latest # Prebuilt image with msfconsole
  script:
    - service postgresql start
    - msfdb init
    - echo 'use auxiliary/scanner/http/dir_scanner
set RHOSTS your.staging.service.com
run
exit' > scan.rc
    - msfconsole -r scan.rc | tee metasploit_output.txt
  artifacts:
    paths:
      - metasploit_output.txt

    You can also use msfrpcd to interact via Python or Ruby scripts to control the run.

📊 2. Post-Processing & Report Parsing

Add a step to parse results and generate human-readable reports or fail the pipeline if critical issues are found.

process_reports:
  stage: security_scan
  image: python:3.12
  script:
    - pip install lxml
    - python parse_reports.py
  dependencies:
    - nmap_scan
    - metasploit_scan
  artifacts:
    paths:
      - final_report.md

    Example parse_reports.py can look for open ports, services, or known CVEs.

🚨 3. Alerting (Optional)

You can use webhook integrations or Slack notifications if vulnerability thresholds are breached.

alert_if_failed:
  stage: security_scan
  script:
    - |
      if grep -q "VULNERABLE" final_report.md; then
        curl -X POST -H 'Content-type: application/json' \
        --data '{"text":"🚨 Critical vulnerability found in penetration test!"}' \
        https://hooks.slack.com/services/YOUR/SLACK/WEBHOOK
        exit 1
      fi




```
