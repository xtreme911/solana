# solana

THIS solbuild.sh FILE HAND COMPILES FROM SOURCE CODE SOLANA FOR EXTRA FAST OPTIMIZING OF YOUR SOLANA EXECUTABLE BINARY SO THAT IT IS AS FAST AS POSSIBLE AND DELIVERS HIGHER PERFORMANCE ON LOWER PERFORMANCE HARDWARE TO ALLOW FASTER CATCHUPS. TESTING HAS REVEALED THAT COMPILING THE SOLANA BINARY ON A RIG CUSTOMIZES THE BINARY IMAGE TO MAXIMIZE UTILIZATION OF YOUR RIGS CUSTOM ARCHITECTURE AS NO TWO SERVERS ARE THE SAME ARCHITECTURE.

THIS solbuild.sh FILE MUST BE RUN AS ROOT

THIS solbuild.sh FILE WILL INSTALL ANY VERSION OF SOLANA ON YOUR RIG BY USING THE VERSION NUMBER YOU WANT AS THE SWITCH LIKE THIS:

FOR VERSION V1.7.1 RUN THIS SCRIPT LIKE THIS:

    solbuild.sh 1.7.1

BEFORE YOU RUN IT YOU CAN SAVE SOME HASSLE BY JUST INSTALLING A FEW UBUNTU PACKAGES FIRST AS ROOT USER:

INSTALL THE PACKAGES BY RUNNING THESE THREE COMMANDS AS ROOT:

    apt-get update
    
    apt-get upgrade

    apt-get install libssl-dev libudev-dev pkg-config zlib1g-dev llvm clang make
                
THEN LOG IN AS YOUR SOLANA USERNAME OR USE THE su COMMAND LIKE THIS AS ROOT USER:

    su <solana username>

THEN RUN THIS SCRIPT solbuild.sh AS YOUR SOLANA USERNAME

THE SOLANA USERNAME HAS TO BE THE SAME USERNAME THAT YOU HAVE IN YOUR sol.service FILE 

YOUR sol.service FILE IS LOCATED AT 

    /etc/systemd/system/sol.service

LOOK IN THE sol.service FILE AND USE THE USERNAME ON THE LINE THAT SAYS:

    User=sol 
    
SO IN THIS CASE THE USERNAME IS sol IN ALL LOWER CASE LETTERS

THE SCRIPT WILL BUILD SOLANA AND IT WILL TAKE 5+ MINUTES SO DO NOT STOP YOUR NODE WHILE YOU COMPILE.

AFTER YOU FINISH THE SCRIPT ALL YOU NEED IS TO RESTART SOLANA LIKE THIS

    systemctl restart sol
    
USE THE NAME THAT YOU GAVE YOUR SERVICE FILE solana.service OR WHATEVER YOU NAMED YOUR SERVICE FILE IN /etc/systemd/system/ DIRECTORY AND YOU ARE DONE!    
