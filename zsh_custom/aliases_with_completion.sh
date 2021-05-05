# gives an interactive terminal into a docker container
function _d.i() {
  _describe 'di' "($(docker ps --format 'table {{.Names}}:{{.Image}}' | tail -n +2 ))"
  return 0
}
function d.i()  {
  if [ "$1" != "" ]
  then
    docker exec -it "$1" /bin/bash || docker exec -it "$1" /bin/sh
  else
    echo -e "Give the name/id of the container"
  fi
}

compdef _d.i d.i

# create a new session
alias t.ls='tmux ls'
 function t.c() {
  if [ "$1" != "" ]
  then
    tmux attach -t "$1" || tmux new -s "$1"
  else
    echo -e "Give the name of the session as a parameter"
  fi
}
_t.c() {
  _arguments ":es:(`tmux ls  2> /dev/null | cut -d ':' -f 1 `)"
}
# Add an auto complete function
compdef _t.c t.c
alias t.t='tmux source-file ~/.tmux.conf'

function cloneBstack() { 
  if [ "$#" != "1" ] 
  then 
    echo 'Give Browerstack Repo name';
  else
    echo "browserstack/$1"
    gh repo clone "browerstack/$1"
  fi
}

#_cloneBstack() {
#  cache-output gh repo list browserstack  | fzf --reverse --prompt="repo> " 
#}
_fzf_complete_cloneBstack() {
  _fzf_complete --height 80% --preview 'cache-output gh repo view browserstack/{} | glow - -s dark' --preview-window=65% --reverse --prompt="doge> " -- "$1" < <(
  cache-output gh repo list browserstack -L 1000 | awk '{ print $1 }' | awk -F"\/" '{ print $2}'
  )
}
# compdef _cloneBstack cloneBstack


if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi

faketty() {
    script -qfc "$(printf "%q " "$@")" /dev/null
}



# faketty PAGER= gh repo list browserstack | fzf --ansi

