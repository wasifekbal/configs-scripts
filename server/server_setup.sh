#!/bin/bash

HOME_DIR=$HOME

# Check Ubuntu distribution
if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    DISTRIBUTION=$DISTRIB_ID
    VERSION=$DISTRIB_RELEASE
# Check Arch Linux distribution
elif [ -f /etc/arch-release ]; then
    DISTRIBUTION="Arch Linux"
# Check CentOS distribution
elif [ -f /etc/centos-release ]; then
    DISTRIBUTION="CentOS"
    VERSION=$(grep -oE '[0-9]+' /etc/centos-release | head -1)
# Unsupported distribution
else
    echo "Unsupported distribution."
    exit 1
fi

echo "[+] Detected distribution: $DISTRIBUTION $VERSION"

# Install required packages based on the distribution
case $DISTRIBUTION in
    Ubuntu)
        sudo apt update
        sudo apt install -y wget curl git zsh
        ;;
    "Arch Linux")
        sudo pacman -Sy --noconfirm wget curl git zsh
        ;;
    CentOS)
        sudo yum install -y wget curl git zsh
        ;;
    *)
        echo "Unsupported distribution: $DISTRIBUTION"
        exit 1
        ;;
esac

echo "[+] Required packages installed successfully."

echo "[+] Setting zsh as default shell."
/usr/bin/chsh -s $(which zsh) $LOGNAME

if [ ! -d $HOME_DIR/.zsh ]; then
    echo "[+] Creating directory $HOME_DIR/.zsh"
    /usr/bin/mkdir -p $HOME_DIR/.zsh
else
    echo "[!] Directory already exists $HOME_DIR/.zsh"
fi

# get the pure terminal prompt. (Pretty, minimal and fast ZSH prompt)
echo "[+] Getting 'pure' zsh terminal prompt"
/usr/bin/git \
    clone \
    --quiet \
    https://github.com/sindresorhus/pure.git \
    "$HOME_DIR/.zsh/pure"

# zsh autosuggestions
echo "[+] Getting zsh-autosuggestions"
/usr/bin/git \
    clone \
    --quiet \
    https://github.com/zsh-users/zsh-autosuggestions \
    "$HOME_DIR/.zsh/zsh-autosuggestions"

# zsh autosuggestions
echo "[+] Getting zsh-syntax-highlighting"
/usr/bin/git \
    clone \
    --quiet \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$HOME_DIR/.zsh/zsh-syntax-highlighting"

/usr/bin/wget -q -O $HOME_DIR/.zsh/directories.sh "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/directories.zsh"

echo "[+] Cloning dotfiles repo in '/tmp/dotfiles'"
/usr/bin/git \
    clone \
    --quiet \
    https://github.com/wasifekbal/dotfiles.git \
    "/tmp/dotfiles"

echo "[+] Copying required configs and dotfiles."
echo "[+] dotfiles:"
echo "    -> .zshrc"
/usr/bin/cp /tmp/dotfiles/server/.zshrc $HOME_DIR/
echo "    -> .tmux.conf"
/usr/bin/cp /tmp/dotfiles/.tmux.conf $HOME_DIR/
echo "    -> .vimrc"
/usr/bin/cp /tmp/dotfiles/.vimrc $HOME_DIR/

if [[ ! -d $HOME_DIR/.config ]]; then
    /usr/bin/mkdir "$HOME_DIR/.config"
fi
echo "[+] Config:"
echo "    -> ranger"
/usr/bin/cp -r /tmp/dotfiles/.config/ranger $HOME_DIR/.config/ranger
# devicons for ranger.
/usr/bin/git -C $HOME_DIR/.config/ranger/plugins/ clone --quiet https://github.com/alexanderjeurissen/ranger_devicons.git

echo "[+] Removing /tmp/dotfiles."
rm -rf /tmp/dotfiles

echo "[+] Finished."
