#!/bin/bash
#

set -eu
set -o pipefail
set +o histexpand

yum makecache
echo "Yum cache update complete"

# BOOTSTRAP_URL="$(hostname -I)"
BOOTSTRAP_URL=$1
# DCOS_DOWNLOAD_URL="https://xmtest.blob.core.windows.net/1dot8/dcos_generate_config.ee.sh"
DCOS_DOWNLOAD_URL=$2

cd /var/tmp

mkdir -p /var/tmp/genconf

tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

echo "Docker repo added"

mkdir -p /etc/systemd/system/docker.service.d && tee /etc/systemd/system/docker.service.d/override.conf <<-'EOF'
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon --storage-driver=overlay -H fd://
EOF

echo "Docker systemd config complete"

yum install --assumeyes --tolerant docker-engine-1.11.2

echo "Docker installed"

systemctl enable docker

echo "Docker enabled"

systemctl start docker

echo "Docker started"

tee /var/tmp/genconf/config.yaml <<-'EOF'
---
bootstrap_url: http://${BOOTSTRAP_URL}:80
cluster_name: 'dcos'
exhibitor_storage_backend: static
ip_detect_filename: /genconf/ip-detect
master_discovery: static
master_list:
- 10.0.10.10
resolvers:
- 8.8.8.8
- 8.8.4.4
oauth_enabled: 'false'
telemetry_enabled: 'false'
superuser_username: 'admin'
superuser_password_hash: '$6$rounds=656000$83725EIL6U0tE/PU$1cJ9wGZ47q2QTQEZbMWK.uuXyB5CUirWRfBlQTDMnFsvH5l5sI50tdlH7TKYTzaPdVbsxix9NWrim1.y3Cfwf/' # Passw0rd
EOF

tee /var/tmp/genconf/ip-detect <<-'EOF'
#!/usr/bin/env bash
set -o nounset -o errexit
ip route get 1 | awk '{print $NF;exit}'
EOF

# curl -O https://downloads.dcos.io/dcos/stable/dcos_generate_config.sh
curl -O "${DCOS_DOWNLOAD_URL}"

bash dcos_generate_config.ee.sh

docker run -d -p 80:80 -v /var/tmp/genconf/serve:/usr/share/nginx/html:ro nginx:alpine
