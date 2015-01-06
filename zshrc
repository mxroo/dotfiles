source /home/jessie/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle debian
antigen bundle vagrant
antigen bundle tmux
antigen bundle command-not-found
antigen bundle sublime
antigen bundle ruby
antigen bundle sudo
antigen bundle screen
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme agnoster

# Tell antigen that you're done.
antigen apply
# User configuration

export PATH="/home/jessie/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

 #Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/id_rsa"

function o()
{
    xdg-open "$1"
}

function chc()
{
    xdg-open "$HOME/ownCloud/Palante Tech Shared/Administrative/Bookkeeping/hours worked charts 2014.ods"
}

function cr()
{
    gpg --quiet --no-tty -d "$HOME/ownCloud/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' 2> /dev/null
}

function cro()
{
    gpg -do '/tmp/'$1'_credentials.txt' "$HOME/ownCloud/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg'
      vi '/tmp/'$1'_credentials.txt'
}

function cre() {
#    gpg -eso "$HOME/ownCloud/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' -r 05431C1FC47B97F5 -r 0A279E082B64B3CA -r 246DB6ED051F78D6 -r C1983031ABC56AB1 -r A5C77224F7958C93 '/tmp/'$1'_credentials.txt'
    gpg -eso "$HOME/ownCloud/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' -r 47AF31A6DE800B77 -r 05431C1FC47B97F5 -r 0A279E082B64B3CA -r 246DB6ED051F78D6 -r C1983031ABC56AB1 -r A5C77224F7958C93 '/tmp/'$1'_credentials.txt'
      rm /tmp/*_credentials.txt
}

function crg() {
    gpg --quiet -d "$HOME/ownCloud/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' | grep git -A 1
}


function me() {
    echo "hextile" | ssvncviewer -scale .8 -autopass -encodings "zywrle tight hextile copyrect" B1RNML2 &> /dev/null &
}
export TERM=xterm-256color

function today()
{
cat ~/Downloads/issues.csv | sed "s/,/qz/" | sed "s/,/\ -\  /" | sed "s/qz/,/g" | sed "s/,/ /g" | sed "s/ 0/ /g" | sed "s/^/* #/g"
rm ~/Downloads/issues.csv
}

#if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

