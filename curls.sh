export $ZQ_CLIENT_ID=`uuidgen`

export TOKEN=`curl -d '{"auth": {"tenantName": "admin", "passwordCredentials": {"username": "admin", "password": "asdf"}}}' -H "Content-type: application/json" http://10.0.2.15:5000/v2.0/tokens | python -c "import sys,json;print json.loads(sys.stdin.readlines()[0])['access']['token']['id']"`


curl -i -X POST http://10.0.2.15:8888/v2/queues/new/subscriptions -d '{"ttl": 999, "subscriber": "mailto:davecusatis1@gmail.com", "options": {"subject": "Hello", "from": "zaqar@example.com"}}' -H "Content-type: application/json" -H "Client-ID: $ZQ_CLIENT_ID" -H "X-Auth-Token: $TOKEN" -H "X-PROJECT-ID: 1105979e8e624a5b9d6426332b15b68e"



