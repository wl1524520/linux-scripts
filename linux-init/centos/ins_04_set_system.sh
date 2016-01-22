echo "127.0.0.1 oracle" >> /etc/hosts

cat conf/set_kernel.conf >> /etc/sysctl.conf
modprobe bridge
/sbin/sysctl -p

cat conf/set_limits.conf >> /etc/security/limits.conf
cat conf/set_pam_login.conf >> /etc/pam.d/login

cat conf/set_profile.sh >> /etc/profile

cat conf/set_oracle_profile.sh >> /home/oracle/.bashrc
