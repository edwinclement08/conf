alias gpg=gpg2
alias mysql=mycli

# zsh/bash
alias mv='mv -v'

alias gg='grv'
alias g.s='git status -s'
alias g.ss='git status'
alias g.c='git commit -m'
alias g.l='git log'
alias g.a='git add . -A'
alias g.d='git diff --cached '
alias g.p='git push'
alias g.pp='git push origin master --set-upstream'
alias g.ac="git add . -A && git commit -m"

alias v=nvim
alias vim=nvim
alias v.t="nvim ~/.tmux.conf"
alias tt=tmuxinator


alias zz='. ~/.zshrc'
alias z.e="vim ~/.zshrc; zz"

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
alias ll="l -hl -s extension"

# lazy docker
alias lzd='lazydocker'

# ping
alias ping='prettyping'

# fzf preview
alias p="fzf --preview 'bat --color \"always\" {}'"

# redis cli
alias redis-cli='iredis'

# notify on MAC OS
function notify() {
  osascript -e "display notification \"$2\" with title \"$1\" sound name \"Glass\""
}


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


