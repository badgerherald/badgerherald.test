# boot-script.sh
#
# Herald boot script for newly provisioned server. Bundled with vagrant
# to set up local development enviornment.

#!/bin/bash

# Set the timezone
echo "US/Central" > /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# make sure our clocks are always on time
echo 'ntpdate ntp.ubuntu.com' > /etc/cron.daily/ntpdate
chmod +x /etc/cron.daily/ntpdate

# Install Puppet
apt-get update -y
apt-get install -y puppet

echo 'Finished provision.sh'

