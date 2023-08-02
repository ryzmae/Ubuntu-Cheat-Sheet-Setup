#!/bin/bash

cd ~

apt-get update -y
apt-get upgrade -y

echo "ryzmSetup || Updated and Upgraded the System"

apt-get -y install sudo

echo "ryzmSetup || Ensured sudo is installed"

apt-get purge -y --auto-remove*

echo "ryzmSetup || Removed default apache package"

apt-get -y install screen git-all rsync curl jq file unzip make gcc g++ python python-dev libtool build-essential wget zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev htop nano

echo "ryzmSetup || Installed default packages/utilities"

apt-get -y install ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release xdg-utils

echo "ryzmSetup || Installed default Libaries."

curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

echo "ryzmSetup || installed node.js"

sudo apt-get install -y ffmpeg python3-pip

echo "ryzmSetup || Installed pip3 and ffmpeg"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
source ~/.bashrc

echo "ryzmSetup || Installed Node Version Manager"

wget https://download.java.net/openjdk/jdk18/ri/openjdk-18+36_linux-x64_bin.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo tar zxvf openjdk-18+36_linux-x64_bin.tar.gz -C /usr/lib/jvm
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-18/bin/java" 1
sudo update-alternatives --set java /usr/lib/jvm/jdk-18/bin/java
java -version
rm openjdk-18+36_linux-x64_bin.tar.gz

echo "ryzmSetup || Installed java version 18"

sudo apt install zsh -y

echo "ryzmSetup || Installed zsh"

chsh -s $(which zsh)

echo "ryzmSetup || Changed default shell to zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "ryzmSetup || Installed oh-my-zsh"

PS3="Do you wan't to install Powerlevel10K?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k;;
            echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc;;
            echo "ryzmSetup || Installed Powerlevel10K";;
            break;;
        "No")
           echo "ryzmSetup || Skipping Powerlevel10K";;
           break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done


PS3="Do you wan't to remove the Welcome screen of Ubuntu?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            touch $HOME/.hushlogin;;
            echo "ryzmSetup || Removed Welcome screen";;
            break;;
        "No")
            echo "ryzmSetup || Skipping Welcome screen";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done


PS3="Do you wan't to install Docker?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            sudo apt install docker.io -y;;
            sudo systemctl start docker;;
            sudo systemctl enable docker;;
            echo "ryzmSetup || Installed Docker";;
            break;;
        "No")
            echo "ryzmSetup || Skipping Docker";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done


PS3="Do you wan't to install Docker-Compose?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            sudo apt install docker-compose -y;;
            echo "ryzmSetup || Installed Docker-Compose";;
            break;;
        "No")
            echo "ryzmSetup || Skipping Docker-Compose";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done

PS3="Do you wan't to install Portainer?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            sudo docker volume create portainer_data;;
            sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce;;
            echo "ryzmSetup || Installed Portainer";;
            break;;
        "No")
            echo "ryzmSetup || Skipping Portainer";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done

PS3="Do you wan't to install neofetch?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            sudo apt install neofetch -y;;
            echo "ryzmSetup || Installed neofetch";;
            break;;
        "No")
            echo "ryzmSetup || Skipping neofetch";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done

PS3="Do you wan't to install Pm2?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            sudo npm install -g pm2;;
            echo "ryzmSetup || Installed Pm2";;
            break;;
        "No")
            echo "ryzmSetup || Skipping Pm2";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done

PS3="Do you wan't to install yarn?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            sudo npm install -g yarn;;
            echo "ryzmSetup || Installed yarn";;
            break;;
        "No")
            echo "ryzmSetup || Skipping yarn";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done

PS3="Do you wan't to install git?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            sudo apt install git -y;;
            echo "ryzmSetup || Installed git";;
            break;;
        "No")
            echo "ryzmSetup || Skipping git";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done

PS3="Do you wan't to install a Lavalink Server and run it?: "

select lng in Yes No
do
    case $lng in
        "Yes")
            git clone https://github.com/ryzmae/docker-compose.yml && git clone https://github.com/ryzmae/application.yml;;
            docker-compose up -d;;
            echo "ryzmSetup || Installed & Started Lavalink";;
            break;;
        "No")
            echo "ryzmSetup || Skipping git";;
            break;;
        *)
           echo "ryzmSetup || Choice Not found!";;
    esac
done