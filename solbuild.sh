#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

git clone https://github.com/solana-labs/solana.git --branch v1.7.1 /usr/local/src/solana1.7.1

/usr/local/src/solana1.7.1/scripts/cargo-install-all.sh /opt/sol

echo ''
echo '* SOURCE COMPILE DONE AND INSTALLED TO /opt/sol'
echo ''
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo '*******************************'

echo ''
echo ''
echo 'NOW EDIT THE sol.service FILE AND '
echo 'CHANGE THE LINE THAT STARTS WITH:'
echo ''
echo 'ExecStart=......'
echo ''
echo 'AND FIX IT TO SAY'
echo ''
echo 'ExecStart=/opt/sol/bin/solana-validator <PUT THE STARTUP SWITCHES HERE THE SAME AS THEY WERE BEFORE>'
echo ''
echo ''
echo 'THEN SAVE THIS FILE AND RELOAD THE DAEMONS LIKE THIS'
echo ''
echo 'systemctl daemon-reload'
echo ''
echo ''
echo ''
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo '*******************************'
