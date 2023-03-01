# dotfiles

## How to use
```bash
$ curl -sO https://raw.githubusercontent.com/Aconitum3/dotfiles/main/bin/installer.sh
$ chmod u+x ./installer.sh
$ ./installer.sh
```

RUN `:PlugInstall` in the first time you run `nvim`.

This installer still only supports Debian. MacOS will be supported someday.

If you run `nvim` installed with this installer in A Docker Container, file type icons may be garbled. You need to check your Terminal settings and set the appropriate Nerd Fonts.
