#!/bin/bash

CMD='
echo -n "Speed (bond0): ";
if [ -f /sys/class/net/bond0/speed ]; then
  cat /sys/class/net/bond0/speed
else
  echo "N/A"
fi

echo "--- Bond Info ---"
if [ -f /proc/net/bonding/bond0 ]; then
  cat /proc/net/bonding/bond0
else
  echo "bond0 not found"
fi
'

for NODE in $(oc get no --no-headers -o custom-columns=NAME:.metadata.name); do
  echo "===================================================="
  echo "NODE : $NODE"
  echo "===================================================="

  ssh -o StrictHostKeyChecking=no \
      -o ConnectTimeout=5 \
      core@"$NODE" "$CMD"

  echo
done
