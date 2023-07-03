# Creating new EC2 instance in AWS

This Ansible Role is used for create a new EC2 instance on AWS cloud provider.

---

Requirements
------------

- boto3
- python >= v2.75
- awscli >= v2
- AWS Resources created:
  - SSH Key
  - Security Group
  - VPC
  - Subnets

---

## Role Variables

Variables are available in vars directory. Read and change this. The required variables are:

- ssh_key:
- instance_type:
- vpc_subnet_id:
- image_id:
- region:
- tag_name:
- tag_ambiente:
- tag_owner:
- disk_size:

---

## Usage Example

```yaml
- name: Create EC2 Instance on AWS Cloud
  hosts: localhost
  connection: local
  collections:
    - amazon.aws
  roles:
    - aws_ec2
  vars_prompt:
    - name: aws_profile
      prompt: What is your AWS profile for authentication?
      private: false
    - name: count
      prompt: How many instances do you want to create?
      private: false
```
