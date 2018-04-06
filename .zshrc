HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt extendedglob

source $HOME/.zplugin/bin/zplugin.zsh

zplugin load geometry-zsh/geometry

zplugin light zdharma/fast-syntax-highlighting
zplugin light zdharma/history-search-multi-word
zplugin light zsh-users/zsh-completions
zplugin light hcgraf/zsh-sudo
zplugin light zsh-users/zsh-autosuggestions
zplugin light zuxfoucault/colored-man-pages_mod

zplugin ice wait'1' atload'_zsh_autosuggest_start' silent
zplugin light zsh-users/zsh-autosuggestions

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

autoload -Uz compinit

compinit -C

export GEOMETRY_SYMBOL_PROMPT="▲"
export GEOMETRY_SYMBOL_RPROMPT="◇"
export GEOMETRY_SYMBOL_EXIT_VALUE="△"
export GEOMETRY_SYMBOL_ROOT="▲"
export PROMPT_GEOMETRY_COLORIZE_SYMBOL=true

alias sudo="sudo "

lscolour() {
  for i in {0..255}
  do
    printf '\x1b[38;5;${i}mcolour${i}\n'
  done
}
loop() {
  while :
  do
    $* && sleep 2
  done
}
validatejson() { cat $* | python -m json.tool >2 }
alias ap='ansible-playbook'
alias s='ssh'

# Enable aliases to be sudo’ed
alias sudo="nocorrect sudo "

# Softwares
alias memcd="/usr/local/opt/memcached/bin/memcached"
alias rds="redis-server /usr/local/etc/redis.conf"

# Shortcuts
alias o="open"
alias oo="open ."
alias e="$EDITOR"
alias g="git"
alias v="vim"
alias gh="github"
alias rm="trash"
alias x+="chmod +x"
alias hf="sudo vim /etc/hosts"
alias hfc="sudo cat /etc/hosts"

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though

# mv, rm, cp, gunzip
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'
alias ungz="gunzip -k"

colourflag="--color"
export CLICOLOR_FORCE=1

# List all files colorized in long format
alias l="gls -lFh ${colourflag}"

# ls options: A = include hidden (but not . or ..), F = put `/` after folders, h = byte unit suffixes
alias ls='ls -AFh ${colourflag} --group-directories-first'

# List all files colorized in long format, including dot files
alias la="ls -lah ${colourflag}"

# List only directories
alias lsd='ls -lh ${colourflag} | grep "^d"'

# `cat` with beautiful colors. requires Pygments installed.
# sudo easy_install -U Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# View HTTP traffic
alias sniff="sudo ngrep -W byline -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias httpr="http --follow --all --max-redirects=10 -h --pretty all"

# Enhanced WHOIS
#alias whois="whois -h whois-servers.net"

# Whatismyip
alias extip="wget http://ipinfo.io/ip -qO -"

alias tower="gittower"

alias torrent="aria2c -x10 "

alias code="code-insiders"

alias copy="pbcopy"

alias gdig='dig @8.8.8.8 +short'