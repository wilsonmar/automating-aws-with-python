# Automating AWS with Python

This began as a fork of a repository for the course *Automating AWS with Python*
which is no longer maintained by its author at A Cloud Guru (now Pluralsight).

However, I've continued adding to this with:

## adot1.sh

AWS's hands-on tutorial "AIOps for DevSecOps"

## 01-webotron

Webotron is a script that syncs a local directory to an s3 bucket, and optionally configure Route 53 and cloudfront as well.

### Features

Webotron currently has the following features:

- List bucket
- List contents of a bucket
- Create and set up bucket
- Sync directory tree to bucket
- Set AWS profile with --profile=<profileName>
- Configure route 53 domain

## 02-notifon

Notifon is a project to notify Slack users of changes to your AWS account using CloudWatch Events

### Features

Notifon currently has the following features:

- Send notifications to Slack when cloudwatch events happen

## 03-videolyzer

Python code in this repo is at version 3.6, so needs updating for new Python coding constructs such as print().

