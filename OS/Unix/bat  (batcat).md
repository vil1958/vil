bat (batcat)

Syntax highlighting

bat supports syntax highlighting for a large number of programming and markup languages

[https://github.com/sharkdp/bat](https://github.com/sharkdp/bat)

[https://github.com/sharkdp/bat/releases](https://github.com/sharkdp/bat/releases)

sudo dpkg -i /home/vil/!/bat_0.21.0_amd64.deb

(replace bat with batcat if you are on Debian or Ubuntu)

bat is available on Ubuntu since 20.04 ("Focal") and Debian since August 2021 (Debian 11 - "Bullseye").

If your Ubuntu/Debian installation is new enough you can simply run:

sudo apt install bat

Important: If you install bat this way, please note that the executable may be installed as batcat instead of bat

 (due to a name clash with another package). You can set up a bat -> batcat symlink or alias to prevent any issues that may come up because

of this and to be consistent with other distributions:

mkdir -p ~/.local/bin

ln -s /usr/bin/batcat ~/.local/bin/bat

How to use

Display a single file on the terminal

> bat README.md

Display multiple files at once

> bat src/*.rs

Read from stdin, determine the syntax automatically (note, highlighting will only work if the syntax can be determined from the first line of the file, usually through a shebang such as #!/bin/sh)

> curl -s https://sh.rustup.rs | bat

Read from stdin, specify the language explicitly

> yaml2json .travis.yml | json_pp | bat -l json

Show and highlight non-printable characters:

> bat -A /etc/hosts

Use it as a cat replacement:

bat > note.md # quickly create a new file

bat header.md content.md footer.md > document.md

bat -n main.rs # show line numbers (only)

bat f - g # output 'f', then stdin, then 'g'.

Integration with other tools

fzf

You can use bat as a previewer for fzf. To do this, use bats --color=always option to force colorized output. You can also use --line-range option to restrict the load times for long files:

fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'

Highlighting --help messages

You can use bat to colorize help text: $ cp --help | bat -plhelp

You can also use a wrapper around this:

# in your .bashrc/.zshrc/*rc

alias bathelp='bat --plain --language=help'

help() {

"$@" --help 2>&1 | bathelp

}

Then you can do $ help cp or $ help git commit.