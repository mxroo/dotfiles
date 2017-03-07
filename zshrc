source /home/jessie/.antigen/antigen.zsh
export SSH_ASKPASS="/usr/bin/ksshaskpass"
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle debian
#antigen bundle vagrant
antigen bundle docker
antigen bundle tmux
antigen bundle command-not-found
antigen bundle sublime
#antigen bundle ruby
antigen bundle sudo
antigen bundle screen
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
# Load the theme.
 antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply
# User configuration

export PATH="/home/jessie/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin/:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/vendor_perl:/usr/bin/core_perl"
# export MANPATH="/usr/local/man:$MANPATH"
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# You may need to manually set your language environment
 export LANG=en_US.UTF-8
alias vi=vim
 #Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export TERM=xterm-256color
alias holdmybeer='sudo -sE'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/id_rsa"
alias startx='ssh-agent startx'
function o()
{
    xdg-open "$1"
}

function chc()
{
    xdg-open "$HOME/ownCloud/Palante Tech Shared/Administrative/Bookkeeping/hours worked charts 2017.ods"
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
    gpg -eso "$HOME/ownCloud/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' -r 1D65D7079BA8560C -r A8D94288FBC3B3AB -r 2614802205808E10 -r 05431C1FC47B97F5 -r 0A279E082B64B3CA -r C1983031ABC56AB1 -r A5C77224F7958C93  '/tmp/'$1'_credentials.txt'
      rm /tmp/*_credentials.txt
}

function crg() {
    gpg --quiet -d "$HOME/ownCloud/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' | grep git -A 1
}



function today()
{
cat ~/Downloads/issues.csv | sed "s/,/qz/" | sed "s/,/\ -\  /" | sed "s/qz/,/g" | sed "s/,/ /g" | sed "s/ 0/ /g" | sed "s/^/* #/g"
rm ~/Downloads/issues.csv
}

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

function sslcheck()
{
    echo | openssl s_client -connect $@ 2>/dev/null | openssl x509 -noout -issuer -subject -dates
}
function sslexpire()
{
    echo | openssl s_client -connect $@ 2>/dev/null | openssl x509 -noout -dates
}
function ssh()
{
    ssh-combine; /usr/bin/ssh $@
}
function rsync()
{
    ssh-combine; /usr/bin/rsync $@
}
function scp()
{
    ssh-combine; /usr/bin/scp "$@"
}
function ssh-combine()
{
    cat $HOME/.ssh/config.d/* > $HOME/.ssh/config
}

