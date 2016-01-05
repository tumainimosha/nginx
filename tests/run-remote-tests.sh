#!/usr/bin/env bash

# Check syntax:
ansible-playbook provisioning/site-test-remote.yml --syntax-check

# Apply playbook:
ansible-playbook provisioning/site-test-remote.yml

# Apply again to check idempotency:
ansible-playbook provisioning/site-test-remote.yml
