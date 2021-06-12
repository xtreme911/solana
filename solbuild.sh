#!/bin/bash
###############################################################################
# README: YOU MUST INDICATE THE VERSION ON THE COMMAND LINE THAT YOU WANT
# TO INSTALL SO IF YOU WANT V1.7.1 ON THE COMMAND LINE YOU ENTER 
#
#                           solbuild.sh 1.7.1
#
###############################################################################

if [ "$EUID" -eq "0" ] ; then 
    echo '****************************'
    echo ''
    echo "    DO NOT RUN AS ROOT" 
    echo ''
    echo '   TERMINATING EXECUTION'
    echo ''
    echo '****************************'
    exit 1 
fi

if [ -z "$1" ]
then
    echo '*****************************************************************************'
    echo ''
    echo 'ERROR: YOU DID NOT ENTER THE VERSION THAT YOU WANT TO COMPILE LIKE THIS 1.7.1'
    echo ''
    echo 'SO NOW IN ORDER TO RUN THIS SCRIPT FOR VERSION 1.7.1 YOU WOULD ENTER THIS:'
    echo ''
    echo '           solbuild.sh 1.7.1'
    echo ''
    echo '*****************************************************************************'
    exit 1
fi

echo ''
echo ''
echo 'IF YOU ARE NOT RUNNING THIS AS THE SOLANA USER PRESS CONTROL-C TO QUIT NOW'
echo ''
echo 'OTHERWISE IF YOU ARE READY TO GO AND RUNNING AS THE SOLANA VALIDATOR USERNAME'
echo ''
echo 'LOG IN AS ROOT ON A SECOND TERMINAL AND RUN THIS:'
echo ''
echo 'apt-get update'
echo ''
echo 'apt-get upgrade'
echo ''
echo 'AND THEN RUN THIS AS ROOT:'
echo ''
echo 'apt-get install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang make'
echo ''
echo ''
echo ''
echo 'AFTER YOU FINISH RUNNING THE apt-get COMMANDS ON THE SECOND TERMINAL'
echo ''
echo 'THEN RETURN TO THIS TERMINAL AND PRESS ANY KEY TO BEGIN COMPILING SOLANA'
echo ''
echo ''
read x
wait
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
wait
rm -rf ~/solana
wait
git clone https://github.com/solana-labs/solana.git --branch v$1 ~/solana
wait
rm -rf ~/.local/share/solana/install/active_release
wait
mkdir -p ~/.local/share/solana/install/active_release
wait
~/solana/scripts/cargo-install-all.sh ~/.local/share/solana/install/active_release
wait

echo '*******************************'
echo '*******************************'
echo '*******************************'
echo ''
echo 'SOURCE COMPILE DONE AND INSTALLED'
echo ''
echo '*******************************'
echo '*******************************'
echo '*******************************'
echo ''
echo ''
echo 'NOW JUST RESTART SOLANA VALIDATOR LIKE THIS:'
echo ''
echo '     systemctl restart sol'
echo ''
echo ''
echo '*******************************'
echo '*******************************'
echo '*******************************'
