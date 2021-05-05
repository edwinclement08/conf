_os=`uname`

if  [[ $_os -eq "Linux" ]] ; then
  _distro=`lsb_release -d`
  echo -e "This is Linux"
  if lsb_release -d | grep -q "Ubuntu"; then
      echo -e "Ubuntu"
  elif lsb_release -d | grep -q "Garuda Linux"; then
      echo -e "Garuda Linux"
  fi
fi


