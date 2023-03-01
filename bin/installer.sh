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

# Backup dotfiles
BACKUPDIR=$HOME/dotbackup
if [ ! -d $BACKUPDIR ]; then
  echo "Backup directory of dotfiles is not found."
  mkdir $BACKUPDIR
  echo "${BACKUPDIR} is created."

  cd $HOME
  for f in .??*; do
    cp "$f" $BACKUPDIR
    echo "$f backed up"
  done
fi

# Check GIT
if !(type "git" > /dev/null 2>&1); then
  echo "git is not found. Install git."
  apt install git
fi

# Clone dotfiles
DOTFILESDIR=$HOME/git/dotfiles
if [ ! -d $DOTFILESDIR ]; then
  echo "Clone dotfiles..."
  git clone https://github.com/aconitum3/dotfiles.git $HOME/git/dotfiles
fi

# Post Symbolic Links
cd $DOTFILESDIR
for f in .??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue

  ln -snfv ${DOTFILESDIR}/"$f" $HOME
done 

# Install locales
if !(locale -a | grep -E "en_US.utf8|en_US.UTF-8" > /dev/null); then
 echo "en_US.UTF-8 is not found. Install locales."
 apt install locales
 locale-gen en_US.UTF-8
fi

# Install vim-plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Font Activate
if !(type "fontconfig" > /dev/null 2>&1); then
  echo "fonconfig is not found. Install fontconfig."
  apt install fontconfig
fi
fc-cache -fv
