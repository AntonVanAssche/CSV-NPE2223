# CSV-NPE2223

This repository contains files related to a school project for the course "Cybersecurity & Virtualisation" (CSV) at Ghent University of Applied Sciences and Arts.

## Description

The objective of this project was to identify and exploit a vulnerability within a software package that can be installed on a Debian virtual machine (VM). The first step involved searching for a specific vulnerability code in the public CVE (Common Vulnerabilities and Exposures) database. Subsequently, the identified vulnerability was targeted for exploitation using the Metasploit Framework. It is important to note that for this project, the use of a pre-configured vulnerable VM (such as Metasploitable) was not allowed, requiring the creation of a vulnerable VM from scratch.

1.   Debian: The Debian virtual machine can be obtained from the following link: [Debian Virtual Machine](https://www.osboxes.org/debian/#debian-8-jessie-vbox). It is based on Debian 8 (Jessie) for VirtualBox.

2.   Kali: The Kali Linux virtual machine is available for download at: Kali [Linux Virtual Machine](https://www.osboxes.org/kali-linux/#kali-linux-2019-1-vbox). The provided image corresponds to Kali Linux 2019.1 for VirtualBox.

These virtual machines were used as part of the project to set up the necessary environments for vulnerability identification and exploitation.

## CVE-2019-6111

CVE-2019-6111 is a vulnerability discovered in OpenSSH version 7.9. In the implementation of scp (secure copy), which is derived from the 1983 rcp (remote copy) utility, the server selects the files/directories to be sent to the client. However, the scp client performs only limited validation of the object name returned, thus making it vulnerable to attacks. Although it prevents directory traversal attacks, a malicious scp server or a Man-in-The-Middle attacker can overwrite arbitrary files in the scp client's target directory. If the recursive operation (-r) is performed, the server can also manipulate subdirectories, enabling the attacker to overwrite critical files such as the .ssh/authorized_keys file.

## Encountered Problems

During the course of the project, we encountered the following challenges:

1.  **Exploiting CVE-2019-6111**: We successfully exploited the chosen CVE (CVE-2019-6111) by implementing a custom `scp` command in Golang. This allowed us to install a malicious `scp` server on the Kali virtual machine, which facilitated the installation of a backdoor onto the Debian machine. Additionally, we modified the user's `.bashrc` file on the Debian machine, enabling us to establish connections on our Kali machine whenever the user logged into a new Bash session.
2.  **Unsuccessful Attack Using Metasploit**: Unfortunately, we encountered difficulties in attacking the Debian client using the Metasploit framework. We suspect that the issue may be related to the chosen "backdoor" implementation. However, due to time constraints and the approaching deadline, we were unable to find a solution to this problem.

Despite the limitations faced, we were able to accomplish the primary objective of exploiting the targeted vulnerability and establishing control over the Debian machine. The encountered problem with the Metasploit framework remains an area for further investigation and improvement.
