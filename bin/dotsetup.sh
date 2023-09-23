# Check OS
if [[ "$OSTYPE" != "linux-gnu" ]]; then
  echo "Your OS is not LINUX! This installer still only supports LINUX."
  exit
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
    echo "$f backed up."
  done
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

# Install vim-plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
