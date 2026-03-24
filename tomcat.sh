dnf install java-21-amazon-corretto -y

wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.1.15/bin/apache-tomcat-10.1.15.tar.gz

tar -zxvf apache-tomcat-10.1.15.tar.gz

cd apache-tomcat-10.1.15

cat <<EOF >> conf/tomcat-users.xml
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<user username="tomcat" password="root123456" roles="manager-gui,manager-script"/>
EOF

sh bin/startup.sh
