export giteaRemoteHost=git@192.168.0.130

function addToGiteaSelf() {
  gitOrigin=`git remote get-url origin `
  if [ $? -eq 128 ] 
  then
    echo "Not a Repository."
    return
  elif [ $? -eq 2 ] 
  then
    echo "Remote <origin> is not set up yet on this repo."
    return
  else
    if [ $? -ne 1 ] 
    then
      echo "Unknown error: $?"
      return
    fi
  fi

  export orgNameOnGithub=`echo $gitOrigin | cut -d':'  -f2 | cut -d'/' -f1`
  export repoNameOnGithub=`echo $gitOrigin | cut -d'/'  -f2 | cut -d'.' -f1`

  echo $orgNameOnGithub
  echo $repoNameOnGithub

  # TODO remove this
  export orgNameOnGithub=edwinclement08

  tea repo ls -o simple -f owner,name | grep "$orgNameOnGithub $repoNameOnGithub" > /dev/null
  if [ $? -eq 0 ] 
  then
    echo "Already exists."
    return
  else
    echo "Repo is not present."
    echo "Creating Repo $orgNameOnGithub:$repoNameOnGithub."
    echo $?
    # tea repo create --owner $orgNameOnGithub --name $repoNameOnGithub # TODO
    tea repo create --name $repoNameOnGithub
    if [ $? -ne 0 ] 
    then
      echo "Failed to create Repo: $?"
      return
    fi
    echo "Repo Successfully created."

    cloneURL="$giteaRemoteHost:$orgNameOnGithub/$repoNameOnGithub.git"
    echo $cloneURL
    git remote add local $cloneURL
    if [ $? -ne 0 ] 
    then
      echo "Failed to add remote <local> as $cloneURL to repo: $?"
      return
    fi
    echo "$cloneURL added as <local> remote."

    git push local --all

  fi


}
