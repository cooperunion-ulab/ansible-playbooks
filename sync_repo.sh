#!/bin/bash
# this is so incredibly dumb
rsync -avz -e "ssh -p31415" --exclude=.git ./ root@comparch.ee.cooper.edu:ansible-playbooks/
