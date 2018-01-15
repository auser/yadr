# Docker
alias dm='docker-machine'
alias dc='docker-compose'

dcexec() {
    # (for docker-compose containers)
    # because it's tedious having to type
    # `docker exec -it myproject_myservice_1 bash`
    # every time I want a shell into a running container
    if [ "$#" -gt 1 ]; then
        arg="$@"
    else
        arg="bash"
    fi
    docker exec -it "${PWD##*/}_$1_1" $arg
}
# eg `dcexec myservice`
dnsmasq-restart(){
    echo "Restarting dnsmasq..."
    sudo launchctl stop homebrew.mxcl.dnsmasq
    sudo launchctl start homebrew.mxcl.dnsmasq
}

dm-test-args() {
    echo "[$ARGS] $NAME"
}

docker-machine-create-nfs() {
    NAME=${1:-dev}
    docker-machine create \
        --driver virtualbox \
        --virtualbox-disk-size "50000" \
        --virtualbox-memory 4096  \
        --virtualbox-cpu-count 2 \
        $NAME
    docker-machine scp \
        $HOME/.yadr/docker/bootsync.sh $NAME:/tmp/bootsync.sh
    docker-machine ssh $NAME \
        "sudo mv /tmp/bootsync.sh /var/lib/boot2docker/bootsync.sh"
    docker-machine restart $NAME
}
docker-machine-env() {
    eval $(docker-machine env $1)
}
alias dme='docker-machine-env'

alias devdcup=''
docker-machine-dns() {
    dmip=$(dm ip $1)
    dnsconf=/usr/local/etc/dnsmasq.conf
    if [ ! -e /etc/resolver/$1 ]; then
        echo "adding $1 entry to resolvers"
        sudo tee /etc/resolver/$1 >/dev/null <<EOF
nameserver 127.0.0.1
EOF
    fi
    if grep -q /$1/$dmip $dnsconf; then
        echo "correct dnsmasq entry already exists"
    elif grep -q ^address=/$1/ $dnsconf; then
        echo "hostname $1 already present in dnsmasq - updating"
        # remove line if ip already present for different hostname
        sed -i '' -E "\%^address=/[[:alnum:]_.-]+/$dmip%d" $dnsconf
        # update existing hostname with new ip
        sed -i '' -E "s%^(address=/$1)/([[:digit:].]+)$%\1/$dmip%g" $dnsconf
        dnsmasq-restart
    else
        # neither hostname nor ip are present
        echo "adding $1/$dmip entry to dnsmasq"
        echo "address=/$1/$dmip" >> /usr/local/etc/dnsmasq.conf
        dnsmasq-restart
    fi
}
docker-machine-compose-dns() {
    NAME=${1:-dash}
    OPERATION=${2:-up}
    docker-compose -f "$HOME/.yadr/docker/dash.yml" -p $NAME $OPERATION
}
docker-machine-use() {
    NAME=${1:-dev}
    docker-machine start $NAME
    docker-machine-dns $NAME
    docker-machine-compose-dns $NAME restart
    docker-machine-env $NAME
}
docker-machine-cleanup() {
    docker images -q --filter "dangling=true" | xargs docker rmi
    docker rm `docker ps --no-trunc -aq`
}
alias dcdns='docker-machine-compose-dns'
alias dmuse='docker-machine-use'
alias dmi='docker-machine-env'