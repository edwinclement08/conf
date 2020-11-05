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
  echo "Give the name/id of the container"
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
    echo "Give the name of the session as a parameter"
  fi
}
_t.c() {
  _arguments ":es:(`tmux ls  2> /dev/null | cut -d ':' -f 1 `)"
}
# Add an auto complete function
compdef _t.c t.c
alias t.t='tmux source-file ~/.tmux.conf'


function di() {
	if [ "$1" != "" ]
	then
		docker exec -it "$1" /bin/bash || docker exec -it "$1" /bin/sh
	else
		echo "Give the name/id of the container"
	fi
}

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
