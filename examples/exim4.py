chroot="/var/chroot/exim4"
testCommandsInsideJail=["/usr/bin/mailq"]
processNames=["exim4"]

preserve=["/var/spool",
	  "/var/log/exim4",
	  "/dev/log"]
users=["Debian-exim"]
groups=["Debian-exim"]

userFiles=["/etc/password",
           "/etc/shadow"]
groupFiles=["/etc/group",
            "/etc/gshadow"]
forceCopy=["/etc/hosts",
           "/etc/aliases"]

# launch makejail
#
# copy the documents and the logs to the jail
# cp -Rp /var/spool /var/chroot/exim4/var/spool
# cp -Rp /var/log/exim4/ /var/chroot/exim4/var/log/exim4
#
# configure syslog to also listen to the socket /var/chroot/exim4/dev/log,
# restart sysklogd
#
# handle /proc in the script (mount when it starts, unmount when it stops):
# chroot /var/chroot/apache /bin/mount /proc
#


