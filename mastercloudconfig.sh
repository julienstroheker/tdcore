    [base64(
        concat('#cloud-config\n\n',
         '{\"bootcmd\": [\"bash -c \\\"if[
    !-f/var/lib/sdb-gpt
    ];thenechoDCOS-5890;parted-s/dev/sdbmklabelgpt;touch/var/lib/sdb-gpt;fi\\\"\"],
     \"disk_setup\": {\"ephemeral0\": {\"layout\": [45, 45, 10], \"overwrite\": true, \"table_type\": \"gpt\"}}, \"fs_setup\": [{\"device\": \"ephemeral0.1\", \"filesystem\": \"ext4\", \"overwrite\": true},
      {\"device\": \"ephemeral0.2\", \"filesystem\": \"ext4\", \"overwrite\": true}, {\"device\": \"ephemeral0.3\", \"filesystem\": \"ext4\", \"overwrite\": true}], \"mounts\": [[\"ephemeral0.1\", \"/var/lib/mesos\"],
       [\"ephemeral0.2\", \"/var/lib/docker\"], [\"ephemeral0.3\", \"/var/tmp\"]], \"runcmd\": [[\"ln\", \"-s\", \"/bin/rm\", \"/usr/bin/rm\"], [\"ln\", \"-s\", \"/bin/mkdir\", \"/usr/bin/mkdir\"], [\"ln\", \"-s\", \"/bin/tar\",
        \"/usr/bin/tar\"], [\"ln\", \"-s\", \"/bin/ln\", \"/usr/bin/ln\"], [\"ln\", \"-s\", \"/bin/cp\", \"/usr/bin/cp\"], [\"ln\", \"-s\", \"/bin/systemctl\", \"/usr/bin/systemctl\"], [\"ln\", \"-s\", \"/bin/mount\", \"/usr/bin/mount\"],
         [\"ln\", \"-s\", \"/bin/bash\", \"/usr/bin/bash\"], [\"ln\", \"-s\", \"/usr/sbin/useradd\", \"/usr/bin/useradd\"], [\"systemctl\", \"disable\", \"--now\", \"resolvconf.service\"], [\"systemctl\", \"mask\", \"--now\", \"lxc-net.service\"],
          [\"systemctl\", \"disable\", \"--now\", \"unscd.service\"], [\"systemctl\", \"stop\", \"--now\", \"unscd.service\"], \"curl -fLsSv --retry 20 -Y 100000 -y 60 -o /var/tmp/1.deb https://az837203.vo.msecnd.net/dcos-deps/libipset3_6.29-1_amd64.deb\",
           \"curl -fLsSv --retry 20 -Y 100000 -y 60 -o /var/tmp/2.deb https://az837203.vo.msecnd.net/dcos-deps/ipset_6.29-1_amd64.deb\", \"curl -fLsSv --retry 20 -Y 100000 -y 60 -o /var/tmp/3.deb https://az837203.vo.msecnd.net/dcos-deps/unzip_6.0-20ubuntu1_amd64.deb\",
            \"curl -fLsSv --retry 20 -Y 100000 -y 60 -o /var/tmp/4.deb https://az837203.vo.msecnd.net/dcos-deps/libltdl7_2.4.6-0.1_amd64.deb\", \"sed -i \\\"s/^Port22$/Port22\\\\nPort2222/1\\\" /etc/ssh/sshd_config\", \"service ssh restart\", \"bash -c \\\"try=1;untildpkg-i/var/tmp/{
    1,
    2,
    3,
    4
    }.deb||((try>9));doechoretry\\\\$((try++));sleep\\\\$((try*try));done\\\"\", [\"cp\", \"-p\", \"/etc/resolv.conf\", \"/tmp/resolv.conf\"], [\"rm\", \"-f\", \"/etc/resolv.conf\"], [\"cp\", \"-p\", \"/tmp/resolv.conf\", \"/etc/resolv.conf\"], 
    [\"systemctl\", \"start\", \"dcos-docker-install.service\"], [\"systemctl\", \"start\", \"dcos-config-writer.service\"], [\"systemctl\", \"restart\", \"systemd-journald.service\"], [\"systemctl\", \"restart\", \"docker.service\"], 
    [\"systemctl\", \"start\", \"dcos-link-env.service\"], [\"systemctl\", \"enable\", \"dcos-setup.service\"], [\"systemctl\", \"--no-block\", \"start\", \"dcos-setup.service\"]], \"write_files\": [{\"content\": \"https://dcosio.azureedge.net/dcos/EarlyAccess\\n\", 
    \"owner\": \"root\", \"path\": \"/etc/mesosphere/setup-flags/repository-url\", \"permissions\": \"0644\"}, {\"content\": \"[\\\"3dt--7847ebb24bf6756c3103902971b34c3f09c3afbd\\\", \\\"adminrouter--0493a6fdaed08e1971871818e194aa4607df4f09\\\", 
    \\\"avro-cpp--760c214063f6b038b522eaf4b768b905fed56ebc\\\", \\\"boost-libs--2015ccb58fb756f61c02ee6aa05cc1e27459a9ec\\\", \\\"bootstrap--59a905ecee27e71168ed44cefda4481fb76b816d\\\", \\\"boto--6344d31eef082c7bd13259b17034ea7b5c34aedf\\\", 
    \\\"check-time--be7d0ba757ec87f9965378fee7c76a6ee5ae996d\\\", \\\"cni--e48337da39a8cd379414acfe0da52a9226a10d24\\\", \\\"cosmos--20decef90f0623ed253a12ec4cf5c148b18d8249\\\", \\\"curl--fc3486c43f98e63f9b12675f1356e8fe842f26b0\\\", 
    \\\"dcos-config--setup_29395bdabe69fa93cda87d3d5c3a9eebe59698ad\\\", \\\"dcos-history--77b0e97d7b25c8bedf8f7da0689cac65b83e3813\\\", \\\"dcos-image--bda6a02bcb2eb21c4218453a870cc584f921a800\\\", \\\"dcos-image-deps--83584fd868e5b470f7cf754424a9a75b328e9b68\\\", 
    \\\"dcos-integration-test--c28bcb2347799dca43083f55e4c7b28503176f9c\\\", \\\"dcos-log--4d630df863228f38c6333e44670b4c4b20a74832\\\", \\\"dcos-metadata--setup_29395bdabe69fa93cda87d3d5c3a9eebe59698ad\\\", \\\"dcos-metrics--23ee2f89c58b1258bc959f1d0dd7debcbb3d79d2\\\", 
    \\\"dcos-oauth--0079529da183c0f23a06d2b069721b6fa6cc7b52\\\", \\\"dcos-signal--1bcd3b612cbdc379380dcba17cdf9a3b6652d9dc\\\", \\\"dcos-ui--d4afd695796404a5b35950c3daddcae322481ac4\\\", \\\"dnspython--0f833eb9a8abeba3179b43f3a200a8cd42d3795a\\\", 
    \\\"docker-gc--59a98ed6446a084bf74e4ff4b8e3479f59ea8528\\\", \\\"dvdcli--5374dd4ffb519f1dcefdec89b2247e3404f2e2e3\\\", \\\"erlang--a9ee2530357a3301e53056b36a93420847b339a3\\\", \\\"exhibitor--72d9d8f947e5411eda524d40dde1a58edeb158ed\\\", \\\"flask--26d1bcdb2d1c3dcf1d2c03bc0d4f29c86d321b21\\\", 
    \\\"java--cd5e921ce66b0d3303883c06d73a657314044304\\\", \\\"libevent--208be855d2be29c9271a7bd6c04723ff79946e02\\\", \\\"libffi--83ce3bd7eda2ef089e57efd2bc16c144d5a1f094\\\", \\\"libsodium--9ff915db08c6bba7d6738af5084e782b13c84bf8\\\", \\\"logrotate--7f7bc4416d3ad101d0c5218872858483b516be07\\\", 
    \\\"marathon--bfb24f7f90cb3cd52a1cb22a07caafa5013bba21\\\", \\\"mesos--aaedd03eee0d57f5c0d49c74ff1e5721862cad98\\\", \\\"mesos-dns--0401501b2b5152d01bfa84ff6d007fdafe414b16\\\", \\\"mesos-modules--311849eaae42696b8a7eefe86b9ab3ebd9bd48f5\\\", \\\"metronome--467e4c64f804dbd4cd8572516e111a3f9298c10d\\\", 
    \\\"navstar--1128db0234105a64fb4be52f4453cd6aa895ff30\\\", \\\"ncurses--d889894b71aa1a5b311bafef0e85479025b4dacb\\\", \\\"octarine--e86d3312691b12523280d56f6260216729aaa0ad\\\", \\\"openssl--b01a32a42e3ccba52b417276e9509a441e1d4a82\\\", 
    \\\"pkgpanda-api--541feb8a8be58bdde8fecf1d2e5bfa0515f5a7d0\\\", \\\"pkgpanda-role--f8a749a4a821476ad2ef7e9dd9d12b6a8c4643a4\\\", \\\"pytest--78aee3e58a049cdab0d266af74f77d658b360b4f\\\", \\\"python--b7a144a49577a223d37d447c568f51330ee95390\\\", 
    \\\"python-azure-mgmt-resource--03c05550f43b0e7a4455c33fe43b0deb755d87f0\\\", \\\"python-cryptography--4184767c68e48801dd394072cb370c610a05029d\\\", \\\"python-dateutil--fdc6ff929f65dd0918cf75a9ad56704683d31781\\\", \\\"python-docopt--beba78faa13e5bf4c52393b4b82d81f3c391aa65\\\", 
    \\\"python-gunicorn--a537f95661fb2689c52fe12510eb0d01cb83af60\\\", \\\"python-isodate--40d378c688e6badfd16676dd8b51b742bfebc8d5\\\", \\\"python-jinja2--7450f5ae5a822f63f7a58c717207be0456df51ed\\\", \\\"python-kazoo--cb7ce13a1068cd82dd84ea0de32b529a760a4bdd\\\", 
    \\\"python-markupsafe--dd46d2a3c58611656a235f96d4adc51b2a7a590e\\\", \\\"python-passlib--802ec3605c0b82428fedba60983b1bafaa036bb8\\\", \\\"python-pyyaml--81dd44cc4a24db7cefa7016c6586a131acf279c3\\\", \\\"python-requests--1b2cadbd3811cc0c2ee235ce927e13ea1d6af41d\\\", 
    \\\"python-retrying--eb7b8bac133f50492b1e1349cbe77c3e38bd02c3\\\", \\\"python-tox--07244f8a939a10353634c952c6d88ec4a3c05736\\\", \\\"rexray--869621bb411c9f2a793ea42cdfeed489e1972aaa\\\", \\\"six--f06424b68523c4dfa2a7c3e7475d479f3d361e42\\\", \\\"spartan--9cc57a3d55452b905d90e3201f56913140914ecc\\\", 
    \\\"strace--7d01796d64994451c1b2b82d161a335cbe90569b\\\", \\\"teamcity-messages--e623a4d86eb3a8d199cefcc240dd4c5460cb2962\\\", \\\"toybox--f235594ab8ea9a2864ee72abe86723d76f92e848\\\"]\\n\", \"owner\": \"root\", \"path\": \"/etc/mesosphere/setup-flags/cluster-packages.json\", \"permissions\": \"0644\"}, 
    {\"content\": \"[Journal]\\nMaxLevelConsole=warning\\nRateLimitInterval=1s\\nRateLimitBurst=20000\\n\", \"owner\": \"root\", \"path\": \"/etc/systemd/journald.conf.d/dcos.conf\", \"permissions\": \"0644\"}, {\"content\": \"rexray:\\n  loglevel: info\\n  modules:\\n    default-admin:\\n      
    host: tcp://127.0.0.1:61003\\n    default-docker:\\n      disabled: true\\n\", \"path\": \"/etc/rexray/config.yml\", \"permissions\": \"0644\"}, 
    {\"content\": \"[Unit]\\nAfter=network-online.target\\nWants=network-online.target\\n[Service]\\nType=oneshot\\nEnvironment=DEBIAN_FRONTEND=noninteractive\\nStandardOutput=journal+console\\nStandardError=journal+console\\nExecStartPre=/usr/bin/curl -fLsSv --retry 20 -Y 100000 -y 60 
    -o /var/tmp/d.deb https://az837203.vo.msecnd.net/dcos-deps/docker-engine_1.11.2-0~xenial_amd64.deb\\nExecStart=/usr/bin/bash -c \\\"try=1;untildpkg-D3-i/var/tmp/d.deb||((try>9));doechoretry$((try++));sleep$((try*try));done;systemctl--nowstartdocker;systemctlrestartdocker.socket\\\"\\n\", 
    \"path\": \"/etc/systemd/system/dcos-docker-install.service\", \"permissions\": \"0644\"}, {\"content\": \"[Service]\\nRestart=always\\nStartLimitInterval=0\\nRestartSec=15\\nLimitNOFILE=16384\\nExecStartPre=-/sbin/ip link del docker0\\nExecStart=\\nExecStart=/usr/bin/docker daemon
     -H fd:// --storage-driver=overlay\\n\", \"path\": \"/etc/systemd/system/docker.service.d/execstart.conf\", \"permissions\": \"0644\"}, 
     {\"content\": \"[Unit]\\nPartOf=docker.service\\n[Socket]\\nListenStream=/var/run/docker.sock\\nSocketMode=0660\\nSocketUser=root\\nSocketGroup=docker\\nListenStream=2375\\nBindIPv6Only=both\\n[Install]\\nWantedBy=sockets.target\\n\", \"path\": \"/etc/systemd/system/docker.socket\", 
     \"permissions\": \"0644\"}, {\"content\": \"[Unit]\\nRequires=dcos-setup.service\\nAfter=dcos-setup.service\\n[Service]\\nType=oneshot\\nEnvironmentFile=/etc/environment\\nEnvironmentFile=/opt/mesosphere/environment\\nExecStart=/usr/bin/bash -c \\\"echo$(detect_ip)$(hostname)>/etc/hosts\\\"\\n\", 
     \"path\": \"/etc/systemd/system/dcos-config-writer.service\", \"permissions\": \"0644\"}, {\"content\": \"\\\"bound_values\\\":\\n  \\\"adminrouter_auth_enabled\\\": |-\\n    ', variables('oauthEnabled'), '\\n  \\\"cluster_name\\\": |-\\n    ', variables('masterPublicIPAddressName'), 
     '\\n  \\\"exhibitor_azure_account_key\\\": |-\\n    ', listKeys(resourceId('Microsoft.Storage/storageAccounts', variables('masterStorageAccountExhibitorName')), '2015-06-15').key1, '\\n  \\\"exhibitor_azure_account_name\\\": |-\\n    ', variables('masterStorageAccountExhibitorName'), 
     '\\n  \\\"exhibitor_azure_prefix\\\": |-\\n    ', variables('masterPublicIPAddressName'), '\\n  \\\"master_list\\\": |-\\n    [\\\"',
    reference(variables('masterVMNic')[
    0
    ]).ipConfigurations[
    0
    ].properties.privateIPAddress,
    '\\\"]\\n  \\\"oauth_enabled\\\": |-\\n    ', variables('oauthEnabled'), '\\n\\\"late_bound_package_id\\\": |-\\n  dcos-provider-29395bdabe69fa93cda87d3d5c3a9eebe59698ad-azure--setup\\n\", \"owner\": \"root\", \"path\": \"/etc/mesosphere/setup-flags/late-config.yaml\", \"permissions\": \"0644\"}, 
    {\"content\": \"[Unit]\\nBefore=dcos.target\\n[Service]\\nType=oneshot\\nStandardOutput=journal+console\\nStandardError=journal+console\\nExecStartPre=/usr/bin/mkdir -p /etc/profile.d\\nExecStart=/usr/bin/ln -sf /opt/mesosphere/bin/add_dcos_path.sh /etc/profile.d/dcos.sh\\n\", 
    \"path\": \"/etc/systemd/system/dcos-link-env.service\", \"permissions\": \"0644\"}, 
    {\"content\": \"[Unit]\\nDescription=Pkgpanda: Download DC/OS to this host.\\nAfter=network-online.target\\nWants=network-online.target\\nConditionPathExists=!/opt/mesosphere/\\n[Service]\\nType=oneshot\\nStandardOutput=journal+console\\nStandardError=journal+console\\nExecStartPre=/usr/bin/curl 
    --keepalive-time 2 -fLsSv --retry 20 -Y 100000 -y 60 -o //var/tmp/bootstrap.tar.xz https://dcosio.azureedge.net/dcos/EarlyAccess/bootstrap/58fd0833ce81b6244fc73bf65b5deb43217b0bd7.bootstrap.tar.xz\\nExecStartPre=/usr/bin/mkdir -p /opt/mesosphere\\nExecStart=/usr/bin/tar -axf //var/tmp/bootstrap.tar.xz
     -C /opt/mesosphere\\nExecStartPost=-/usr/bin/rm -f //var/tmp/bootstrap.tar.xz\\n\", \"path\": \"/etc/systemd/system/dcos-download.service\", \"permissions\": \"0644\"}, 
     {\"content\": \"[Unit]\\nDescription=Pkgpanda: Specialize DC/OS for this host.\\nRequires=dcos-download.service\\nAfter=dcos-download.service\\n[Service]\\nType=oneshot\\nStandardOutput=journal+console\\nStandardError=journal+console\\n
     EnvironmentFile=/opt/mesosphere/environment\\nExecStart=/opt/mesosphere/bin/pkgpanda setup --no-block-systemd\\n[Install]\\nWantedBy=multi-user.target\\n\", \"path\": \"/etc/systemd/system/dcos-setup.service\", \"permissions\": \"0644\"}, 
     {\"content\": \"\", \"path\": \"/etc/mesosphere/roles/master\"}, {\"content\": \"\", \"path\": \"/etc/mesosphere/roles/azure_master\"}, {\"content\": \"\", \"path\": \"/etc/mesosphere/roles/azure\"}]}')
     )
     ]