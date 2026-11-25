#!/bin/bash
sudo apt update -y
sudo apt install -y ansible python3-boto3 python3-botocore
ansible-galaxy collection install amazon.aws
mkdir -p /home/ubuntu/ansible
cat <<EOF> /home/ubuntu/ansible/ansible.cfg
[defaults]
inventory = aws_ec2.yaml
remote_user = ubuntu
private_key_file = /home/ubuntu/.ssh/aws-key.pem
host_key_checking = False
EOF

cat <<EOF> /home/ubuntu/ansible/aws_ec2.yaml
plugin: amazon.aws.aws_ec2

regions:
  - us-east-1

hostnames:
  - private-ip-address

compose:
  ansible_host: private_ip_address
  ansible_user: ubuntu

keyed_groups:
  - key: tags.Name
    prefix: ""
EOF
chmod 644 /home/ubuntu/ansible/aws_ec2.yaml
chmod 644 /home/ubuntu/ansible/ansible.cfg
chown -R ubuntu:ubuntu /home/ubuntu/ansible

sudo apt update -y 
sudo apt install fontconfig openjdk-21-jre -y 
java -version
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y 