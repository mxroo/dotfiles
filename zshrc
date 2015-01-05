# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/	
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime debian command-not-found autojump ruby python rails screen sudo tmux)

# User configuration

export PATH="/home/jessie/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
fi