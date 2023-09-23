# Check OS
if [[ "$OSTYPE" != "linux-gnu" ]]; then
  echo "Your OS is not LINUX! This installer still only supports LINUX."
  exit
fi  

# Check & Update APT
if type "apt" > /dev/null 2>&1; then
  apt update
else
  echo "This installer still only supports apt."
  exit
fi

# Install NEOVIM
if !(type "nvim" > /dev/null 2>&1); then
  echo "neovim is not found. Install neovim."
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  mv squashfs-root /
  ln -s /squashfs-root/AppRun /usr/bin/nvim
fi

# Check GIT
if !(type "git" > /dev/null 2>&1); then
  echo "git is not found. Install git."
  apt install git
fi

# Install locales
if !(locale -a | grep -E "en_US.utf8|en_US.UTF-8" > /dev/null); then
 echo "en_US.UTF-8 is not found. Install locales."
 apt install locales
 locale-gen en_US.UTF-8
fi

# Install prerequisite packages for nvim plugins

# treesitter, telescope-fzf-native 
apt install build-essential

# telescope-fzf-native
apt install fzf
