#!/bin/bash
set -e

# manage users, remove password and add them to sudoers
useradd -m -s /bin/bash cbenezech
usermod -aG sudo cbenezech

useradd -m -s /bin/bash dbadmin
usermod -aG sudo dbadmin