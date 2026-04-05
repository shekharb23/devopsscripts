#Install python & ansible
dnf update -y
dnf install python3-pip -y
pip3 install ansible
ansible --version
#add all remote machines to ansible master
#make ssh connection to all client machines from master
#for ssh connection
#start multiexec
#set passwd of root
#commmand :-
passwd root
#go to
vi /etc/ssh/sshd_config
#Edit the below parameters
permitrootpasswd yes
authenticationpassword yes
authenticationpassword no
#Comment last two lines in the file
restart sshd
systemctl restart sshd
#comeback to ansible master and generate keys
ssh-keygen
#copy keys to remote machine
ssh-copy-id roo@hostnameremote
#on remote machine for hostname
hostname -i
#copy id to all client machines
#To give inventory in hosts file check ansible directory is present in /etc
#If present open hosts file 
#If not present ansible directory then manually create ansible directory
mkdir -p /etc/ansible
vi /etc/ansible/hosts
#group it like
[prod]
hostname
[dev]
hostname
# Create ansible.cfg file in ansible directory
vi /etc/ansible/ansible.cfg
#Add below lines in ansible.cfg file
[defaults]
inventory = /etc/ansible/hosts
host_key_checking = False
#Verify setup by following command
ansible all -m ping
#Now u can run AdHoc commands from AdHoc commands file

