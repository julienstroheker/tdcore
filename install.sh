BOOTSTRAP_URL=$1
ROLE=$2

mkdir /tmp/dcos
cd /tmp/dcos
curl -O http://${BOOTSTRAP_URL}/dcos_install.sh
curl -X POST --data-urlencode 'payload={"channel": "#dh-paas-infra-azure", "username": "DeploymentBot", "text": "Deploying '${ROLE}' on '$HOSTNAME'"}' https://hooks.slack.com/services/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
sudo bash dcos_install.sh ${ROLE}
curl -X POST --data-urlencode 'payload={"channel": "#dh-paas-infra-azure", "username": "DeploymentBot", "text": "Deployment '${ROLE}' done on '$HOSTNAME'"}' https://hooks.slack.com/services/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
