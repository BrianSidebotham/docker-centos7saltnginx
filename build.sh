#!/bin/bash

saltversion=${1}

must() {
  $@
  if [ $? -ne 0 ]; then
    echo "ERROR: running $@" >&2
    exit 1
  fi
}

must yum update -y

must yum install -y https://repo.saltstack.com/py3/redhat/salt-py3-repo-${saltversion}.el$(rpm -E %{rhel}).noarch.rpm
must yum install -y iproute salt-minion

must yum install -y epel-release
must yum install -y curl nginx
