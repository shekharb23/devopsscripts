
#!/bin/bash

# Install Java
dnf install java-21-amazon-corretto -y

# Move to /opt (better practice)
cd /opt

# Download stable Tomcat (archive = no 404 issues)
wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.15/bin/apache-tomcat-10.1.15.tar.gz

# Extract
tar -zxvf apache-tomcat-10.1.15.tar.gz

# Rename for simplicity
mv apache-tomcat-10.1.15 tomcat

cd tomcat

# Fix tomcat-users.xml (clean overwrite)
cat > conf/tomcat-users.xml <<EOF
<tomcat-users>
  <role rolename="manager-gui"/>
  <user username="tomcat" password="root123456" roles="manager-gui"/>
</tomcat-users>
EOF

# Allow remote access (remove IP restriction safely)
sed -i 's/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/<!-- &/' webapps/manager/META-INF/context.xml
sed -i 's/\/>/\/> -->/' webapps/manager/META-INF/context.xml

# Give execute permission
chmod +x bin/*.sh

# Start Tomcat
sh bin/startup.sh

# Open firewall (if enabled)
systemctl enable firewalld >/dev/null 2>&1
systemctl start firewalld >/dev/null 2>&1
firewall-cmd --permanent --add-port=8080/tcp >/dev/null 2>&1
firewall-cmd --reload >/dev/null 2>&1

echo "======================================="
echo "Tomcat Installed Successfully!"
echo "Access URL: http://<your-server-ip>:8080"
echo "Manager URL: http://<your-server-ip>:8080/manager/html"
echo "Username: tomcat"
echo "Password: root123456"
echo "======================================="
