powercycle:
  runner.salt.cmd:
    - args:
      - fun: cmd.run
      - cmd: /bin/echo  '* * * * * root /bin/bash -c \'if [ $(ls /var/cache/salt/minion/proc/ | wc -l) = "0" ] ; then /sbin/reboot; rm -f ; fi\'' > /etc/cron.d/powercycle_after_salt
      - onchanges_any:
        - sls: packages
        - sls: apt.pinning
