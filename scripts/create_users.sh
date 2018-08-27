htpasswd -c -b /etc/origin/maser/htpasswd admin redhat
htpasswd -c -b /etc/origin/maser/htpasswd amy amy
htpasswd -c -b /etc/origin/maser/htpasswd andrew andrew

oc label user/amy level=AlphaCorp

htpasswd -c -b /etc/origin/maser/htpasswd brian brian
htpasswd -c -b /etc/origin/maser/htpasswd betty betty
oc label user/amy level=BetaCorp

