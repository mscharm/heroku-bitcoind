cd ~
bash options.sh
wget https://bitcoin.org/bin/bitcoin-core-0.10.0/bitcoin-0.10.0-linux64.tar.gz
tar xvf bitcoin-0.10.0-linux64.tar.gz
#cd bitcoin-0.10.0/bin && ./bitcoind >> bitcoind.log &
mkdir .bitcoin
export PASS=`openssl rand -hex 32`
echo "server=1
checkblocks=1
daemon=1
rpcssl=0
rpcuser=bitcoinrpc
rpcpassword=$PASS" > .bitcoin/bitcoin.conf
./bitcoin-0.10.0/bin/bitcoind -printtoconsole -regtest & >> bitcoind.log
echo "Success <a href="/getinfo"> node info </a> " >> bitcoind.log
python server.py 
