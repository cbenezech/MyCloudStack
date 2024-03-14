#!/bin/bash
set -e

# Installing goss
curl -L https://github.com/aelsabbahy/goss/releases/download/v0.4.9/goss-linux-amd64 -o /usr/local/bin/goss
chmod +rx /usr/local/bin/goss