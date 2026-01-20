#!/bin/bash

CMD='free -h && hostnamectl && lscpu'

for NODE in $(oc get no --no-headers -o custom-columns=NAME:.metadata.name); do
  echo "===================================================="
  echo "NODE : $NODE"
  echo "===================================================="

  ssh -o StrictHostKeyChecking=no \
      -o ConnectTimeout=5 \
      core@"$NODE" "$CMD"

  echo
done
