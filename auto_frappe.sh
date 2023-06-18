#!/bin/bash

##############################################
# This script is intended for Ubuntu servers #
##############################################

export XDG_CONFIG_HOME=$HOME
export XDG_CONFIG_CONFIG=$HOME/.config

function install_nvm {
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    # required for nvm
    export NVM_DIR="$HOME/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo -e "\n[+] Installing latest nodejs LTS version"
    nvm install --lts
    echo -e "\n[+] Current Nodejs version $(node --version)"
    echo -e "[+] Current npm version $(npm --version)"
}

# Read the contents of /etc/os-release into variables
. /etc/os-release

# Check if the Ubunte version is less than 20.04
if [[ $VERSION_ID < "20.04" ]]; then
    echo -e "\n[!] Ubuntu version is older than 20.04"
    echo -e "[!] Adding repo for mariadb from ubuntu xenial."
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.ubuntu-tw.org/mirror/mariadb/repo/10.3/ubuntu xenial main'
fi

# Update and upgrade the packages
echo -e "\n[+] Updating packages..."
sudo apt update
echo -e "\n[+] Upgrading packages..."
sudo apt upgrade -y

# Installing required packages.
echo "\n[+] Installing required packages..."
sudo apt install -y \
    git \
    python3 \
    python3-dev \
    python3-pip \
    redis-server \
    software-properties-common \
    mariadb-server \
    mariadb-client

printf "\n"
read -p "$ Did you got a prompt to set the MySQL root password? [Y/n] " got_mysql_prompt;

sleep 2
if [[ "$got_mysql_prompt" == "n" ]]; then
    sudo mysql_secure_installation
fi

# Append lines to /etc/mysql/my.cnf
echo -e "\n[+] Adding config to /etc/mysql/my.cnf"
echo "#######################################"
sudo tee -a /etc/mysql/my.cnf << EOF

[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci

[mysql]
default-character-set = utf8mb4

EOF
echo "#######################################"

# restart mysql aka mariadb service
sudo systemctl restart mysql.service


# Get Node Version Manager - POSIX-compliant bash script to manage multiple active node.js versions
if [[ -d $HOME/.nvm ]]; then
    echo -e "\nnvm is already installed."
    read -p "Do you want to reinstall nvm? (y/N): " reinstall_nvm
    if [[ $reinstall_nvm == "y" || $reinstall_nvm == "Y" ]]; then
        echo -e "\n[+] Reinstalling nvm..."
        install_nvm
    else
        echo -e "\n[+] Skipping nvm re-installation..."
    fi
else
    echo -e "\n[+] Installing nvm...."
    install_nvm
fi

# get yarn globally
echo -e "\n\n[+] Installing Yarn..."
npm install -g yarn

# Installing wkhtmltopdf....
echo -e "\n\n[+] Installing wkhtmltopdf...."
sudo apt install xvfb libfontconfig wkhtmltopdf

echo -e "\n\n[+] Installing frappe-bench python package..."
pip3 install frappe-bench
echo -e "\n[+] Current bench version $(bench --version)"

echo -e "\n[+] All installation complete.."
echo -e "[+] Restart The Terminal."
echo -e "[+] After terminal restart, do 'bench init <folder-name>' to create a frappe bench."

