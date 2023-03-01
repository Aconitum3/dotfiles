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
  apt install neovim
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
 source ${HOME}/.bash_profile
fi


