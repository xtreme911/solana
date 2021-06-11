#!/bin/sh
###############################################################################
# README: YOU MUST INDICATE THE VERSION ON THE COMMAND LINE THAT YOU WANT
# TO INSTALL SO IF YOU WANT V1.7.1 ON THE COMMAND YOU ENTER 
#
#                           solbuild.sh 1.7.1
#
###############################################################################
#if (!( $EUID != 0 )); then
 #   echo ''
 #   echo ''
 #   echo "DO NOT RUN THIS AS ROOT"
 #   echo ''
 #   echo ''
 #   exit
#fi

echo ''
echo ''
echo ''
echo 'WARNING THIS FILE MUST BE RUN AS THE SAME USERNAME THAT YOU RUN THE SOLANA-VALIDATOR WITH'
echo ''
echo 'IF YOU ARE RUNNING THIS AS ROOT IT WILL FAIL AND NOT WORK RIGHT'
echo ''
echo 'IF YOU ARE NOT RUNNING THIS AS THE SOLANA USER PRESS CONTROL-C TO QUIT NOW'
echo ''
echo 'OTHERWISE IF YOU ARE READY TO GO AND RUNNING AS THE SOL VALIDATOR USERNAME'
echo ''
echo 'WE TRY AND INSTALL NEEDED FILES IN UBUNTU WITH APTITUDE BUT IF IT FAILS LOG IN AS ROOT AND RUN THIS:'
echo ''
echo 'apt-get update'
echo ''
echo 'AND THEN RUN THIS AS ROOT:'
echo ''
echo 'apt-get install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang make'
echo ''
echo 'PRESS ANY KEY TO BEGIN'
read x
sudo apt-get update
wait
sudo apt-get install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang make
wait
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
wait
git clone https://github.com/solana-labs/solana.git --branch v$1 
wait
rm -rf ~/.local/share/solana/install/active_release
wait
mkdir -p ~/.local/share/solana/install/active_release
wait
/usr/local/src/solana1.7.1/scripts/cargo-install-all.sh ~/.local/share/solana/install/active_release
wait

echo ''
echo '* SOURCE COMPILE DONE AND INSTALLED'
echo ''
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo ''
echo ''
echo 'NOW JUST RESTART SOLANA VALIDATOR LIKE THIS:'
echo ''
echo 'CHANGE THE USERNAME THAT YOU RUN SOLANA VALIDATOR IF ITS NOT sol'
echo ''
echo '  systemctl restart sol'
echo ''
echo ''
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo '*******************************'
