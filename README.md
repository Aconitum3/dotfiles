# dotfiles

## How to use
```bash
curl -sO https://raw.githubusercontent.com/Aconitum3/dotfiles/main/bin/installer.sh
curl -sO https://raw.githubusercontent.com/Aconitum3/dotfiles/main/bin/dotsetup.sh
chmod u+x ./installer.sh
sudo bash ./installer.sh
bash ./dotsetup.sh
```

RUN `:PlugInstall` in the first time you run `nvim`.

This installer still only supports Debian. MacOS will be supported someday.

If you run `nvim` installed with this installer in A Docker Container, file type icons may be garbled. You need to check your Terminal settings and set the appropriate Nerd Fonts.

Recommended Nerd Fonts: [yuru7/HackGen](https://github.com/yuru7/HackGen)
