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
alias g.ac="git add . -A && git commit -m"

alias v=vim
alias v.t="vim ~/.tmux.conf"
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
alias lg='lg'

# lazy docker
alias lzd='lazydocker'

# ping
alias ping='prettyping'

# fzf preview
alias p="fzf --preview 'bat --color \"always\" {}'"

# redis cli
alias redis-cli='iredis'

# notify
function notify() {
  osascript -e "display notification \"$2\" with title \"$1\" sound name \"Glass\""
}


