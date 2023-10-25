#!/bin/bash
echo "1.To install jenkins and java 11 "
echo "2.To install Docker and its dependencies"
read -r value
case $value in
1)
    echo "checking the instance for its os "
    os_name=$(awk -F= '$1=="ID" {print $2}' /etc/os-release)
    if [ "$os_name" = "ubuntu" ]; then
        sudo apt update
        sudo apt install openjdk-11-jdk -y
        sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
            https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
        echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
            https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
            /etc/apt/sources.list.d/jenkins.list >/dev/null
        sudo apt-get update
        sudo apt-get install jenkins -y 
    fi
    ;;
2)  echo "checking the instance for its os "
    os_name=$(awk -F= '$1=="ID" {print $2}' /etc/os-release)
    if [ "$os_name" = "ubuntu" ]; then
       sudo apt update 
       echo "install Docker and its dependencies"
       echo "downloading script "
       curl -fsSL https://get.docker.com -o install-docker.sh
       echo "verify the scripts content "
       cat install-docker.sh
       echo "Running the script "
       sudo sh install-docker.sh 
    fi
    echo "the script is installed add the ubuntu user to docker group"
    usermod -aG docker ubuntu 
    echo "exit and relogin to your machine "
    ;;
esac
#awk -F= '$1=="ID" {print $2 }' /etc/os-release
