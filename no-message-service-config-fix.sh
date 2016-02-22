export ZAQAR_SERVICE="$(openstack service create --name zaqar --description "Zaqar Messaging" messaging | grep id | awk '{ print $4 }')"

openstack endpoint create --region RegionOne --publicurl "http://10.0.2.15:8888" --adminurl "http://10.0.2.15:8888" --internalurl "http://10.0.2.15:8888" $ZAQAR_SERVICE
