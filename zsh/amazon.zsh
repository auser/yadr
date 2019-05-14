export PATH=/usr/local/amazon/bin:$PATH
export PATH=$HOME/.toolbox/bin:$PATH

  SSH_CERT=~/.ssh/id_rsa-cert.pub
  if (! test -f "$SSH_CERT") || (test "`find ~/.ssh/id_rsa-cert.pub -mmin +1220`"); then
    echo "Midway expired"
    if mwinit; then
      ssh-add -D ~/.ssh/*_rsa
      ssh-add ~/.ssh/*_rsa
    else
      echo "Failed to authenticate."
      exit 1
    fi
  fi
