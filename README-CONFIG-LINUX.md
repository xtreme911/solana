####################################################################################     
      
BEFORE YOU CAN RUN SOLANA VALIDATOIN YOU MUST SET UP YOUR LINUX BOX 

BY RUNNING THESE COMMANDS AND EDITING THE FILES THEY OPEN IN NANO

####################################################################################
    
RUN 

    nano /etc/sysctl.d/20-solana-udp-buffers.conf

ADD THIS TO FILE

    # Increase UDP buffer size
    net.core.rmem_default = 134217728
    net.core.rmem_max = 134217728
    net.core.wmem_default = 134217728
    net.core.wmem_max = 134217728   
    
RUN 

    sysctl -p /etc/sysctl.d/20-solana-udp-buffers.conf
    
RUN 

    nano /etc/sysctl.d/20-solana-mmaps.conf

ADD THIS TO FILE    
    
    # Increase memory mapped files limit
    vm.max_map_count = 700000
    
RUN 

    sysctl -p /etc/sysctl.d/20-solana-mmaps.conf

RUN

    nano /etc/systemd/system.conf
    
ADD TO [MANAGER] SECTION OF FILE /etc/systemd/system.conf
    
    DefaultLimitNOFILE=700000   

THEN RELOAD DAEMON WITH SYSTEMCTL COMMAND

    systemctl daemon-reload
        
RUN 

    nano /etc/security/limits.d/90-solana-nofiles.conf 

ADD THIS TO FILE

    # Increase process file descriptor count limit
    * - nofile 700000
    
THEN LOGOUT AND LOGIN


MOVE LOGROTATE TO CRON.HOURLY

     mv /etc/cron.daily/logrotate /etc/cron.hourly/

EDIT /etc/logrotate.d/rsyslog AND CHANGE TO SIZE=500M

    nano /etc/logrotate.d/rsyslog
    
    CHANGE daily TO size=500M
    
RESTART LOGROTATE

    systemctl restart logrotate
