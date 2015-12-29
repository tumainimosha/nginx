#!/usr/bin/env bash

# Check syntax:
ansible-playbook provisioning/site-test-local.yml --syntax-check

# Apply playbook:
ansible-playbook provisioning/site-test-local.yml

# Apply again to check idempotency:
ansible-playbook provisioning/site-test-local.yml
