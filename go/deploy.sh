#!/bin/bash
make || exit

SERVER=isucon11-app1
# SERVER=isucon11-app2
# SERVER=isucon11-app3​

ssh $SERVER << EOF
sudo systemctl stop   isucondition.go.service
EOF

sftp $SERVER <<EOF
put isucondition
EOF

ssh $SERVER << EOF
sudo systemctl start  isucondition.go.service
sudo systemctl status isucondition.go.service
isulog lotate
EOF
