alias gpg=gpg2
alias mysql=mycli

# common stuff
alias h='head -n '
alias t='tail -n '
alias c=cat
alias l=ls
alias g=grep
alias e=emacsclient -c

alias iso='date "+%Y-%m-%d" | pbcopy'

# zsh/bash
alias mv='mv -v'

alias gg='grv'

# Git aliases
alias g.s='git status -s'
alias g.ss='git status'
alias g.c='gitmoji -c'
alias g.l='git log'
alias g.a='git add . -A'
alias g.d='git diff --cached '
alias g.p='git push'
alias g.pp='git push origin master --set-upstream'
alias g.ac="git add . -A && git commit -m"

# Github Aliases
alias h.p.s="gh pr list -S"

# Gitea Aliases
source ~/conf/zsh_custom/gitea.sh

alias vim=nvim
alias v=vim
alias tt=tmuxinator

# Reload Configuration
alias zz='exec zsh'
alias zz.a='. ~/conf/zsh_custom/aliases.sh; . ~/conf/zsh_custom/aliases_with_completion.sh'
alias zz.b='. ~/.bs_secrets'
alias tt="tmux source ~/.tmux.conf"

# Edit Configuration
alias v.s="vim ~/.SpaceVim.d/init.toml"

# Edit Configuration, and reload 
alias v.t="vim ~/.tmux.conf; tt"
alias v.v="vim ~/.config/nvim/init.vim"
alias v.za="vim ~/conf/zsh_custom/aliases.sh; zz.a"
alias v.zc="vim ~/conf/zsh_custom; zz"
alias v.z="vim ~/.zshrc; zz"
alias v.a="nvim ~/.alacritty.yml"
alias v.b="nvim ~/.bs_secrets; zz.b"

# Directory Aliases
alias cdd="cd ~/Downloads"
alias cdb="cd ~/bin"

# Get Mac CPU temps
alias get_cpu_temps='sudo powermetrics --samplers smc |grep -i "CPU die temperature"'

# autovote
alias autovote=aur-auto-vote edwinclement08

# ESP-IDF
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias get_tty="ls -l /dev/tty* | egrep -v 'tty(S|[0-9])'"


# Quick Directory swap
alias cdd="cd ~/Downloads"
alias cdc="cd ~/coding"
alias cd.n="cd ~/.config/nvim"

# docker(& compose) stuff
alias d.c='docker-compose up'
alias d.c.b='docker-compose up --build'
alias d.ps='docker ps --format "table {{.Image}}\t{{.Names}}\t{{.Ports}}"'

# brew - no update
alias brew.i='HOMEBREW_NO_AUTO_UPDATE=1 brew install'

# Ruby
alias biwp="bundle install --without production"
alias rake='noglob rake' # Needed for preventing Zsh from breaking rake argumments

# cat
alias cat="bat"

# lazy git
alias lg="lazygit"
alias ls="exa -lFh --group-directories-first --git --icons"
alias ll="\ls"

# lazy docker
alias lzd='lazydocker'

# ping
alias ping='prettyping'

# fzf preview
alias p="fzf --preview 'bat --color \"always\" {}'"

# redis cli
alias redis-cli='iredis'

# Eve help
alias reconnect_mouse="ssh eve sh /boot/config/usbDevices/reconnect_mouse.sh"

# notify on MAC OS
function notify() {
  osascript -e "display notification \"$2\" with title \"$1\" sound name \"Glass\""
}

jq_tail() {
  jq -cR '. as $raw | try fromjson catch $raw'
}

jq_strip_meta_data() {
  jq -c '.timestamp=.meta.timestamp | del(.data,.meta) | . as $raw | try fromjson catch $raw'
}


# Browserstack aliases
# Kubernetes shortcut
exec_pod() {
  kubectl exec -it $(kubectl get pods | fzf | awk '{ print $1 }') -- sh
}

get_k8s_keys() { 
  server=`kubectl get pods | awk '{ print $1 }' | grep rails-local` && kubectl exec -it $server -- cat config/initializers/keys.yml
}
logs_k8s_rails_local() { 
  server=`kubectl get pods | awk '{ print $1 }' | grep rails-local ` && kubectl exec -it $server -- tail -f log/production.log | grep -v "chitragupta_loss_check"
}
logs_k8s_rails_live() { 
  server=`kubectl get pods | awk '{ print $1 }' | grep rails-live ` && kubectl exec -it $server -- tail -f log/production.log
}

# alias get_k8s_keys="kubectl exec -it $(kubectl get pods | awk '{ print $1 \}' | grep rails-local ) -- cat config/initializers/keys.yml"
# alias logs_k8s_rails_local="kubectl exec -it $(kubectl get pods | awk '{ print $1 }' | grep rails-local ) -- tail -f log/production.log"
# alias logs_k8s_rails_live="kubectl exec -it $(kubectl get pods | awk '{ print $1 }' | grep rails-live ) -- tail -f log/production.log"



# Staging Repeater Logs
alias logs_repeater_003="ssh repeater-staging-003 -- tail -f /ebs/node-repeater.log | jq_tail"
alias logs_repeater_004="ssh repeater-staging-004 -- tail -f /ebs/node-repeater.log | jq_tail"

filter_repeater() {
  grep -v chitragupta_loss_check \
  | grep -v "No authTokens found. Nothing to send to repeater disconnect" \
  | grep -v "[sendMetricsToInvoker] Error:" \
  | jq_strip_meta_data
}

# Invoke Local Binary for envs
alias BrowserStackLocal_devlocal='BrowserStackLocal --key $BS_KEY_dev_local --bs-host k8s-devlocal.bsstag.com'
alias BrowserStackLocal_prod='BrowserStackLocal --key $BS_KEY'


#Get terminal color codes
# for use in tmux and the like
function get_term_colors() {
  for i in {0..255}; do
      printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
  done
}

# TODO Add a conditional here to only load these in arch systems
# Common use aliases
alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages
alias tb='nc termbin.com 9999'

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"


alias get_installed_packages=" expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n 10"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
