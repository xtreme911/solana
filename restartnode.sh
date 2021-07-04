#!/bin/sh

if [ "$EUID" -ne "0" ] ; then 
    echo '****************************'
    echo ''
    echo "       RUN AS ROOT" 
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
    echo 'ERROR: YOU DID NOT ENTER PARAMETERS ON THE COMMAND LINE'
    echo ''
    echo 'THE FIRST PARAMETER ON COMMAND LINE MUST BE THE LEDGER DIRECTORY' 
    echo ''
    echo 'AND THE SECOND PARAMETER IS THE USERNAME THAT YOU HAVE GIVEN TO THE SOLANA USER'
    echo ''
    echo 'AND THE THIRD PARAMETER IS THE SOL.SERVICE FILE PREFIX TO RESTART SOLANA'
    echo ''
    echo 'COMMAND SHOULD LOOK LIKE THIS FOR USERNAME sol LEDGER DIR /ledger AND SOL SERVICE NAME OF solana.service'
    echo ''
    echo '                restartnode.sh /ledger sol solana'
    echo ''
    echo '*****************************************************************************'
    exit 1
fi

mkdir -p /tmp/sol
rm -rf /tmp/sol/*
systemctl stop $3
mv $1/snapshot* /tmp/sol/
rm -rf /$1
mv /tmp/sol $1
chown -R $2:$2 $1
systemctl start $3
