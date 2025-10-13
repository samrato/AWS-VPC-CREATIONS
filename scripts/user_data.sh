#!/bin/bash

# Update package index and install required packages
sudo yum update -y
sudo yum install -y httpd

# Start and enable Apache web server
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a simple HTML file
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>AWS Terraform Workshop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }
        h1 {
            color: #232f3e;
        }
        .container {
            margin-top: 40px;
            padding: 20px;
            background-color: #f8f8f8;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .aws-color {
            color: #ff9900;
        }
    </style>
</head>
<body>
    <h1>Hello from <span class="aws-color">AWS</span> Terraform Workshop</h1>
    <div class="container">
        <p>This server was provisioned using Infrastructure as Code with Terraform.</p>
        <p>Instance ID: $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</p>
        <p>Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</p>
        <p>Instance Type: $(curl -s http://169.254.169.254/latest/meta-data/instance-type)</p>
        <p>Public IP: $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)</p>
    </div>
</body>
</html>
EOF

# Set proper permissions
sudo chown -R apache:apache /var/www/html
sudo chmod -R 755 /var/www/html

# Install CloudWatch agent for monitoring
sudo yum install -y amazon-cloudwatch-agent

echo "User data script execution completed"
