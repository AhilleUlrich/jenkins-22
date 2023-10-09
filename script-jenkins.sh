#!/bin/bash

# Update the packages
echo "-------------------------------------------------------------------"
echo "             Step 1 : UPDATE THE PACKAGES                          "
echo "-------------------------------------------------------------------"
echo " "

sudo apt-get update -y

# java 17 isntallation
echo "-------------------------------------------------------------------"
echo "             Step 2 : JAVA 17 INSTALLATION                         "
echo "-------------------------------------------------------------------"
echo " "
sudo apt install openjdk-17-jre -y

# check java version

java --version

# curl and git installation
echo "-------------------------------------------------------------------"
echo "             Step 3 : CURL AND GIT INSTALLATION                    "
echo "-------------------------------------------------------------------"
echo " "
sudo apt-get install curl git -y 
# 
echo "-------------------------------------------------------------------"
echo "             Step 4 : ADD JENKINS REPOSITORY                       "
echo "-------------------------------------------------------------------"
echo " "
echo " curl command installation"
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

#
echo " echo deb ......."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

#
echo "-------------------------------------------------------------------"
echo "             Step 4 : UPDATE THE PACKAGES                          "
echo "-------------------------------------------------------------------"
echo " "
echo " Update the packages again"
sudo apt-get update -y

#
echo "-------------------------------------------------------------------"
echo "             Step 5 : JENKINS INSTALLATION                         "
echo "-------------------------------------------------------------------"
echo " "
echo "Jenkins installation "
sudo apt-get install jenkins -y

# enable jenkins
echo "-------------------------------------------------------------------"
echo "             Step 6 : ENABLE AND START JENKINS                      "
echo "-------------------------------------------------------------------"
echo " "
echo "Enable jenkins"

sudo systemctl enable --now jenkins

# start jenkins
echo " Start of jenkins"

sudo systemctl start jenkins

#
echo "-------------------------------------------------------------------"
echo "             Step 3: CONFIGURE FIREWALL                            "
echo "-------------------------------------------------------------------"
echo " "
echo " Enable 8080 on firewall"

sudo ufw allow 8080

echo " Enable ssh on firewall"

sudo ufw allow ssh
sudo ufw enable

sudo ufw status

echo  "---------------------------------------------"
echo  "        SHOW JENKINS ADMIN  PASSWORD         "
echo  "---------------------------------------------"
echo " "
echo "The Admin password is :" $(sudo cat /var/lib/jenkins/secrets/initialAdmin)


