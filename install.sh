BOOTSTRAP_URL=$1
ROLE=$2

mkdir /tmp/dcos
cd /tmp/dcos
curl -O http://${bootstrap_url}/dcos_install.sh
sudo bash dcos_install.sh ${role}
