function changeMac() {
        local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
        sudo ifconfig en0 ether $mac
        sudo ifconfig en0 ether down
        sudo ifconfig en0 ether up
        echo "Your new physical address is $mac"
}
