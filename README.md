# Group Policy Management with Active Directory Home Lab  

## Objective  

To design and implement a secure, scalable Active Directory (AD) environment using  
Windows Server 2022. This project demonstrates my core AD skills for Group policy  
creation and management.  

## Tools and Technologies Used  

- Oracle VirtualBox – Virtualization platform  
- Windows Server 2022 – Domain Controller and Active Directory Domain Services (ADDS)  
- Microsoft Active Directory – Directory management and user provisioning  
- PowerShell – Scripting for automation  
- Draw.io – Diagramming  

## Project Scope  

Platform : Oracle VirtualBox  
Domain : exiflab.com  
Operating System : Windows Server 2022 (4GB RAM , 2 5 GB Storage), Window 10 Pro (64bit)  

## Environment Setup  

Deployed a virtualized Windows Server 2022 instance on Oracle VirtualBox with internal  
networking to enable inter-VM communication. Installed Active Directory Domain  
Services (ADDS) and promoted the server to a Domain Controller (DC) for the domain  
exiflab.com.  

![OU Structure](images/OU-Structure.png)  

## Organizational Unit (OU) Structure  

Created a structured Organizational Unit (OU) hierarchy to reflect company  
departments:  

- Finance  
- Operations  
- Management  
- Marketing  

I have assigned 3-5 users to simulate a real world.  

To showcase automation skills, I created the computer OU in the PowerShell – find it my  
ps1 script file.  

![Creating the OUs](images/Creating-the-OUs.png)  

It has been used to the automate the OU creation using PowerShell which enhances  
efficiency repeatability and accuracy.  

## Connecting with Windows Client  

The project presented several challenges along the way, with one of the most significant  
being the installation of the Windows 10 Professional ISO on VirtualBox. I encountered  
an error related to the product key in the unattended answer file during the installation  
process.  

![Connected with Windows Client](https://raw.githubusercontent.com/nur-exif/nurs/f58c5352c07e6d4127764efdbf12e822a5d2810b/Connected%20with%20Windows%20Client.png)


After conducting some research on online forums, I discovered a solution. I decided to  
bypass the alert in the VirtualBox expert settings under storage, which resolved the  
issue and allowed the installation to proceed successfully.  

Following the installation, I navigated to the  
Network Adapter settings > Change Adapter Options > Properties > IPv.  

Here, I configured a static IP address and entered the DNS address of the Active  
Directory domain.  

To verify the connection, I used Command Prompt to ping the DNS address, which  
resulted in a successful connection with 0% packet loss.  

## Group Policy Configuration  

Group Policy in Active Directory allows administrators to define and manage policies for  
users and computers within the domain, ensuring consistent configurations across the  
network.  

For this project, I configured cross-functional group policies that applied uniformly  
across all departments. These policies were designed to enforce security settings,  
software installations, and user configurations, ensuring that the same standards and  
practices were maintained, regardless of the department or location.  

### 1. Password Hardening Policy (Security Compliance)  

**Configuration:**  
Tools> Group Policy Management > Create Group Policy Objects  

- Enforce password history: 5 passwords remembered  
- Minimum password length: 12 characters  
- Maximum password age: 30 days  
- Password complexity: Enabled  

![Password Enforcement](images/Password-Enforcement.png)  

Enforcing strict password policies is fundamental to defend against brute-force attacks  
and credential theft. By requiring complex passwords and regular changes, this policy  
mitigates password reuse and ensures stronger authentication across departments. It  
aligns with compliance frameworks like NIST and ISO2 7001.  

### 2. Disable Removable Media  

**Configuration:**  
Administrative Templates: Policy Definition > System > All Removable Storage Classes:  
Deny all access  

![Removable Media Access Block](images/Removable-Media-Access-Block.png)  

Blocking USB drives and external devices prevents data exfiltration, malware  
introduction, and insider threats. This proactive policy safeguards sensitive financial  
data and intellectual property by preventing unauthorized data transfers. It can be  
critical for industries that handle sensitive information (e.g., Finance, HR), ensuring data  
integrity and confidentiality.  

### 3. Block Control Panel Access (Restrict System Changes)  

**Configuration:**  
Administrative Templates > Control Panel > Settings Page Visibility.  
Here I enabled the option by using the command _hide_* to hide all the all-control panel  
items  

![Hiding Control Panel](images/Hiding-Control-Panel.png)  

Limiting access to system settings reduces the risk of unauthorized system  
modifications or misconfigurations by end users. This policy enforces role-based  
access control by ensuring only administrators can alter critical system settings,  
preventing accidental or malicious changes.  

It simplifies system administration by maintaining consistent configurations across user  
environments.  

^_____^  

Lastly, I look forward to extending on this project with the principles learned from my  
CompTIA Security+ certification. Happy Holidays. 
