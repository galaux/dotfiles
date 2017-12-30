alias l='ls -Ahl --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color'
alias mktcd='cd $(mktemp -d)'
alias cpe='rsync -t --progress $@'
alias ~make="inotifywait -m -r -e close_write --exclude '.*.sw[a-z]' src/ | while read line; do make; done"
alias vim='/usr/bin/nvim'
alias vimdiff='/usr/bin/nvim -d'
alias svnd='svn diff | colordiff'
alias ip='ip -c'
alias g='git'

showswap() {
  test -n $1 && count=$1
  for file in /proc/*/status ; do
    awk '/VmSwap|Name/{printf $2 " " $3}END{ print ""}' ${file}
  done | sort -k 2 -n -r | head -${count}
}

source ~/.config.d/aliases.sh 2> /dev/null
