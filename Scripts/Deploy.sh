#!/bin/bash

export ENV_NAME=$1
echo $ENV_NAME

echo /u01/Jenkins_scripts/Properties/$ENV_NAME.properties
source /u01/Jenkins_scripts/Properties/$ENV_NAME.properties

echo "Copying java-tomcat-maven-example.war from Master machine to /u01/apache-tomcat-8.5.71/webapps"
sshpass -p ${Password} scp -r /var/lib/jenkins/workspace/Deployment/target/java-tomcat-maven-example.war ${Username}@${IP_Address}:/u01/apache-tomcat-8.5.71/webapps

echo "Connecting to Target machine via SSH"
sshpass -p ${Password} ssh -t -t ${Username}@${IP_Address} <<EOSPL
  hostname -i
  exit

EOSPL
