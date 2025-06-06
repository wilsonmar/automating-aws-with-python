#!/bin/bash
#!/usr/bin/env sh
# This is https://github.com/wilsonmar/automating-aws-with-python/blob/main/adot1.sh
# to run the AWS AIOps tutorial at 
# https://atp2.labs.awsevents.com/sa/lab/arn%3Aaws%3Alearningcontent%3Aus-east-1%3A470679935125%3Ablueprintversion%2FSPL-CX-300-DOIATX-1%3A1.0.2-06b924bf/en-US/468057f2-ab3b-4b05-be28-470c350a4a5d::iLsqWHFeLQr3DP3Y7WFTuQ
#
# 1. manual steps: Start lab. Open Console. 
# 3. manually copy the LabWorkspaceURL URL value and paste it into a new browser tab. 
#       Such as: https://dbr2wy8rla23d.cloudfront.net/?folder=/home/ec2-user/environment
# 4. Manually copy password, switch, and paste Code-Server 
# 5. Manually click Allow to the pop-up on the upper left.

# Copy this line and paste in the GCP Terminal CLI:
#    sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/automating-aws-with-python/main/adot.sh)" -v
# If you see this, do the steps manually:
#    curl: (28) Failed to connect to raw.githubusercontent.com port 443 after 300945 ms: Timeout was reached

# 6. Download and install the ADOT Collector:
sudo rpm -Uvh https://aws-otel-collector.s3.amazonaws.com/amazon_linux/amd64/latest/aws-otel-collector.rpm

# 7. Configure and start the ADOT Collector,
sudo /opt/aws/aws-otel-collector/bin/aws-otel-collector-ctl -a start

# 8. Inspect the ADOT Collector configuration:
sudo cat /opt/aws/aws-otel-collector/etc/config.yaml

# 9. Install the Python aws-opentelemetry-distro package:
pip3 install --no-index --find-links=/tmp/pip_packages aws-opentelemetry-distro~=0.7.0

# 10. Configure OpenTelemetry and launch an instrumented version of the application:
export OTEL_PYTHON_DISTRO="aws_distro"
export OTEL_PYTHON_CONFIGURATOR="aws_configurator"
export OTEL_PYTHON_URLLIB3_EXCLUDED_URLS="http://169.254.169.254/"
export OTEL_SERVICE_NAME=TravelApp
opentelemetry-instrument flask run

# when you see the pop-up "Your application running on port 5000 is available" at the bottom right of the developer environment, 
# click "Open in Browser" to view the "City app" tab showing the web application.

# Excercise the web application tab to generate some trace activity:
# Choose a city (London),
# use both the itinerary planner and review bot features.

# "The server encountered an internal error and was unable to complete your request. Either the server is overloaded or there is an error in the application."

# App suggestion: Add "Wheelchair accessible".

# X-Ray traces are available in the X-Ray console.

# To launch a misconfigured instance of the application, run the following command.
KNOWLEDGE_BASE_ID=this_is_broken opentelemetry-instrument flask run


