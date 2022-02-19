#create local *.key and *.crt
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls1.key -out tls1.crt -subj "/CN=v1.example.com" -days 365

openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls2.key -out tls2.crt -subj "/CN=v2.example.com" -days 365

#create secrets
	
kubectl create secret tls test-tls-1 --key="tls1.key" --cert="tls1.crt"

kubectl create secret tls test-tls-2 --key="tls2.key" --cert="tls2.crt"


#check works site
curl -k https://v1.example.com
curl -k https://v2.example.com

curl --cacert tls1.crt https://v1.example.com
curl --cacert tls2.crt https://v2.example.com