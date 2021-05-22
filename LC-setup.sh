#!/bin/bash

for i in `ps aux | grep yum | grep -v "grep" | awk {'print $2'}`; do kill -9 $i ; done

yum install httpd -y
systemctl restart httpd.service
systemctl enable httpd.service
yum install mariadb-server.x86_64 -y
systemctl restart mariadb.service
systemctl enable mariadb.service
amazon-linux-extras install php7.4 -y

cat <<EOF > /var/www/html/index.php
<?php
\$output = shell_exec('echo $HOSTNAME');
echo "<h1><center><pre>\$output</pre></center></h1>";
echo "<h1><center>This is a HA website running on Application Load Balancer and AutoScaling created using Terraform </center></h1>"
?>
EOF

systemctl restart httpd.service 
