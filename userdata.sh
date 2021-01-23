#!/bin/bash
yum install -y docker
service docker start
usermod -a -G docker ec2-user
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
chkconfig docker on
yum install -y git
service docker start
usermod -a -G docker ec2-user


cd /home/ec2-user
su ec2-user
git clone https://github.com/thecodingmachine/workadventure.git
cd workadventure

export DOMAIN='example.net'
sed -i "s/workadventure.localhost/$DOMAIN/g" docker-compose.yaml
docker-compose up
