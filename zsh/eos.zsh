alias cleos='docker exec eosio /opt/eosio/bin/cleos --wallet-url http://localhost:8888'

alias start_eos='docker run --rm --name eosio -p 8888:8888 -p 9876:9876 -v /tmp/work:/work -v /tmp/eosio/data:/mnt/dev/data -v /tmp/eosio/config:/mnt/dev/config eosio/eos-dev  /bin/bash -c "nodeos -e -p eosio --plugin eosio::wallet_api_plugin --plugin eosio::wallet_plugin --plugin eosio::producer_plugin --plugin eosio::history_plugin --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin --plugin eosio::http_plugin -d /mnt/dev/data --config-dir /mnt/dev/config --http-server-address=0.0.0.0:8888 --access-control-allow-origin=* --contracts-console"'
alias stop_eos='docker ps | grep eos awk "{print $1}" | xargs docker kill'

export PATH="$HOME/Development/eos/open-source/eos/build/tools:$PATH"
export PATH="/usr/local/eosio/bin:$PATH"

# export DC_EOS="/Users/auser/Development/eos/open-source/eos/Docker/docker-compose.yml"
# alias cleos='docker-compose -f $DC_EOS exec keosd /opt/eosio/bin/cleos -u http://nodeosd:8888 --wallet-url http://localhost:8900'
# alias start_eos='docker-compose -f $DC_EOS start'
# alias stop_eos='docker-compose $DC_EOS stop'
