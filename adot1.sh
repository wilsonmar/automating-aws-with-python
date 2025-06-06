#!/bin/bash
#!/usr/bin/env sh
# This is https://github.com/wilsonmar/automating-aws-with-python/blob/main/adot1.sh
# to run the AWS AIOps tutorial at 
# https://atp2.labs.awsevents.com/sa/lab/arn%3Aaws%3Alearningcontent%3Aus-east-1%3A470679935125%3Ablueprintversion%2FSPL-CX-300-DOIATX-1%3A1.0.2-06b924bf/en-US/468057f2-ab3b-4b05-be28-470c350a4a5d::iLsqWHFeLQr3DP3Y7WFTuQ
#
# Copy this line and paste in the GCP Terminal CLI:
#    sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilsonmar/automating-aws-with-python/main/adot.sh)"

# 1. thru 5. are manual steps.

# 6. To download and install the ADOT Collector
sudo rpm -Uvh https://aws-otel-collector.s3.amazonaws.com/amazon_linux/amd64/latest/aws-otel-collector.rpm

# 7. To configure and start the ADOT Collector,
sudo /opt/aws/aws-otel-collector/bin/aws-otel-collector-ctl -a start

# 8. To inspect the ADOT Collector configuration,
sudo cat /opt/aws/aws-otel-collector/etc/config.yaml

# 9. To install the Python aws-opentelemetry-distro package,
pip3 install --no-index --find-links=/tmp/pip_packages aws-opentelemetry-distro~=0.7.0

# 10. To configure OpenTelemetry and launch an instrumented version of the application,
export OTEL_PYTHON_DISTRO="aws_distro"
export OTEL_PYTHON_CONFIGURATOR="aws_configurator"
export OTEL_PYTHON_URLLIB3_EXCLUDED_URLS="http://169.254.169.254/"
export OTEL_SERVICE_NAME=TravelApp

opentelemetry-instrument flask run

# "Your application running on port 5000 is available"  dialog appears in the bottom right of the developer environment, 
# Choose Open in Browser to view the updated application.

# In the application tab, use the application to generate some trace activity. 
# Choose a city, and use both the itinerary planner and review bot features.

# X-Ray traces are available in the X-Ray console.

# To launch a misconfigured instance of the application, run the following command.
KNOWLEDGE_BASE_ID=this_is_broken opentelemetry-instrument flask run


