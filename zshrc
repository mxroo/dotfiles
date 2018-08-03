# following functions stolen from github.com/meskarune
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-`'\'',.]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' original true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/jessie/.zshrc'

autoload -Uz compinit
compinit

bindkey -v
bindkey '^R' history-incremental-search-backward

function x() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)  tar xjf "$1"      ;;
            *.tar.gz)   tar xzf "$1"      ;;
            *.tar.Z)    tar xzf "$1"      ;;
            *.bz2)      bunzip2 "$1"      ;;
            *.rar)      unrar x "$1"      ;;
            *.gz)       gunzip "$1"       ;;
            *.jar)      unzip "$1"        ;;
            *.tar)      tar xf "$1"       ;;
            *.tbz2)     tar xjf "$1"      ;;
            *.tgz)      tar xzf "$1"      ;;
            *.zip)      unzip "$1"        ;;
            *.Z)        uncompress "$1"   ;;
            *)          echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a file"
    fi
}

function downforme() {
    RED='\e[1;31m'
    GREEN='\e[1;32m'
    YELLOW='\e[1;33m'
    NC='\e[0m'
    if [ $# = 0 ]
    then
        echo -e "${YELLOW}usage:${NC} downforme website_url"
    else
JUSTYOUARRAY=($(lynx -dump http://downforeveryoneorjustme.com/$1 | grep -o "It's just you"))
        if [ ${#JUSTYOUARRAY} != 0 ]
        then
            echo -e "${RED}It's just you. \n${NC}$1 is up."
        else
            echo -e "${GREEN}It's not just you! \n${NC}$1 looks down from here."
        fi
    fi
}

alias grepfiles='grep -riP --color=auto' # list all matches in all files in a dir
alias grepdir='grep -rilP --color=auto' # list all files with a match in a dir
alias weather='curl wttr.in/NewYork'
alias diskspace='du -h --max-depth=1'
alias fuck='$(thefuck $(fc -ln -1))'
alias tt='tmux new-session -d -n main'

#Prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1
setopt prompt_subst
autoload -Uz colors && colors

fg_alert=%{$'\e[38;5;161m'%}
at_normal=%{$'\e[0m'%}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo "[ %{$fg[magenta]%}virt:%{$reset_color%} "$(basename $VIRTUAL_ENV)" ] "
}

if [[ ${TERM} == "linux" ]]; then
    GIT_PROMPT_SYMBOL="%{$fg[green]%}git:"
    GIT_PROMPT_CLEAN="%{$fg_bold[green]%}-"
    GIT_PROMPT_AHEAD="%{$fg_bold[yellow]%}> NUM"
    GIT_PROMPT_BEHIND="%{$fg_bold[yellow]%}< NUM"
    GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}Y"
    GIT_PROMPT_UNTRACKED="${fg_alert}!"
    GIT_PROMPT_MODIFIED="${fg_alert}+"
    GIT_PROMPT_STAGED="%{$fg_bold[blue]%}="
else
    GIT_PROMPT_SYMBOL="%{$fg[green]%} "
    GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔ "
    GIT_PROMPT_AHEAD="%{$fg_bold[yellow]%}🡩 NUM "
    GIT_PROMPT_BEHIND="%{$fg_bold[yellow]%}🡩 NUM "
    GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}🜉 "
    GIT_PROMPT_UNTRACKED="${fg_alert}✗ "
    GIT_PROMPT_MODIFIED="${fg_alert}➕ "
    GIT_PROMPT_STAGED="%{$fg_bold[blue]%}🟓 "
fi

function parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}
function parse_git_state() {
    local GIT_STATE=""
    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_AHEAD" -gt 0 ]; then
            GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
        fi
    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
        if [ "$NUM_BEHIND" -gt 0 ]; then
            GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
        fi
    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
        if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
            GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
        fi
    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
    fi
    if ! git diff --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
    fi
    if ! git diff --cached --quiet 2> /dev/null; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
    fi
    if [ -z "$(git status --porcelain)" ]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_CLEAN
    fi
    if [[ -n $GIT_STATE ]]; then
        echo "$GIT_STATE"
    fi
}
function git_prompt_string() {
    local git_where="$(parse_git_branch)"
    [ -n "$git_where" ] && echo "[ $GIT_PROMPT_SYMBOL %{$reset_color%}${git_where#(refs/heads/|tags/)} $(parse_git_state)%{$reset_color%} ] "
}

PROMPT='%{$fg_bold[yellow]%}%n%{$reset_color%}@%{$fg_bold[magenta]%}%m %{$fg_bold[blue]%}%4~%{$reset_color%} $(git_prompt_string)$(virtualenv_info)%# '
RPROMPT="%* [%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

export PATH="/home/jessie/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin/:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/vendor_perl:/usr/bin/core_perl:/root/.gem/ruby/2.5.0/bin"
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
    xdg-open "$HOME/ownCloud/Palante Tech Shared/Administrative/Bookkeeping/hours worked charts 2018.ods"
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
    gpg -eso "$HOME/ownCloud/Palante Tech Shared/Credentials/"$1'_credentials.txt.gpg' -r 1D65D7079BA8560C -r A8D94288FBC3B3AB -r 0A279E082B64B3CA -r C1983031ABC56AB1 -r A5C77224F7958C93 -r 7E0E633D11153582  -r FC63CA690E2CEF06CA890791CFB26CC380EE84D6 -r A9C55AF9 '/tmp/'$1'_credentials.txt'
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


