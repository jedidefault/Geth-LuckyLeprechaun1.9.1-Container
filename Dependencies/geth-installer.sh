#Apply Updates and Upgrades
echo -e "\e[34mInstalling Initial updates...\e[em"
sudo apt-get update && apt-get upgrade -y

#Install Dependencies
echo -e "\e[34mInstalling Dependencies...\e[0m"
sudo apt-get -y install dphys-swapfile build-essential libgmp3-dev golang git python curl

#Configuring Repository Settings
echo -e "\e[34mConfiguring HTTPS Repo Settings...\e[0m"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


#Install Docker
echo -e "\e[34mInstalling Docker Prerequisits...\e[0m"
sudo apt-get purge docker lxc-docker docker-engine docker.io
sudo apt-get install  curl  apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo -e "\e[34mDocker Install Init...\e[0m"
sudo apt-get update
sudo apt-get install docker-ce

#Apply Updates and Upgrades
echo -e "\e[34mInstalling Updates and Performing OS Upgrades...\e[em"
sudo apt-get update && apt-get upgrade -y

#Install go-ethereum OR `geth`
echo -e "\e[34mInstalling go-ethereum...\e[0m"
cd ~
git clone https://github.com/ethereum/go-ethereum
cd go-ethereum
make geth

#Check Services Post install
sudo systemctl status docker