# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# set PATH
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# export environment variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
