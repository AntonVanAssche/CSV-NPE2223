#!/usr/bin/env bash

set -o errexit # Abort on nonzero exit code.
set -o nounset # Abort on unbound variable.
set -o pipefail # Don't hide errors within pipes.
# set -o xtrace   # Enable for debugging.

connection='Wired connection 1'
nmcli con mod "${connection}" ipv4.addresses 192.168.0.121/24
nmcli con mod "${connection}" ipv4.gateway 192.168.0.1
nmcli con mod "${connection}" ipv4.dns '1.1.1.1'
nmcli con mod "${connection}" ipv4.method manual
nmcli con up "${connection}"
