function o()
{
    xdg-open "$1"
}

function chc()
{
    xdg-open "$HOME/ownCloud/Palante Tech Shared/Administrative/Bookkeeping/hours worked charts 2015.ods"
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

export pts=~/ownCloud/Shared/Palante*Shared
export cl=~/ownCloud/Shared/Palante*Shared/Current*Projects

function me() {
    echo "hextile" | ssvncviewer -scale .8 -autopass -encodings "zywrle tight hextile copyrect" B1RNML2 &> /dev/null &
}
export TERM=xterm-256color
