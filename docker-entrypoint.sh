#!/bin/sh
set -e

# write default config
if [ ! -f /srv/bird/bird.conf ]; then

cat <<- EOF > /srv/bird/bird.conf
  protocol kernel {
    persist;                # Don't remove routes on bird shutdown
    scan time 20;           # Scan kernel routing table every 20 seconds
    export all;             # Default is export none
  }

  protocol device {
    scan time 10;           # Scan interfaces every 10 seconds
  }
EOF

fi

exec "$@"