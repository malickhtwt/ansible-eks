###############################
# AWS CLI v2 Installer script #
###############################
sudo apt update
sudo apt install unzip
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
aws --version
printf '\nAWS CLI v2 installed successfully\n\n'

############################################
# Ansible and AWS Python libraries via pip #
############################################
sudo apt update -y
sudo apt install python3-pip -y
python3 -m pip install --upgrade pip
python3 -m pip install ansible boto boto3 --user

############################
# Docker and Docker Compose#
############################

sudo apt-get update -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo usermod -aG docker $(whoami)
newgrp docker
printf '\nDocker installed successfully\n\n'

udo apt-get install docker-compose -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker container run hello-world
printf '\nDocker Compose installed successfully\n\n'

###################################
# Run Docker command without Sudo #
###################################

echo "///////////////////////////////////////////"
docker --version
docker-compose --version

