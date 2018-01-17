生成证书

``` bash
mkdir cert
cd /vagrant/resources/cert

openssl genrsa -out ca.key 2048
openssl req -new -x509 -days 3650 -key ca.key -out ca.crt -subj "/C=CN/ST=BJ/L=BJ/O=ifnoelse/OU=ifnoelse/CN=ifnoelse"

openssl genrsa -out server.key 2048  
openssl req -new -key server.key -out server.csr -subj "/C=CN/ST=BJ/L=BJ/O=ifnoelse/OU=ifnoelse/CN=*.ifnoelse.com"
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 3650 -out server.crt


openssl genrsa -out client.key 2048
openssl req -new -key client.key -out client.csr -subj "/C=CN/ST=BJ/L=BJ/O=ifnoelse/OU=ifnoelse/CN=client"
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -days 3650 -out client.crt

nginx -s reload
```

导出证书

``` bash
openssl pkcs12 -export -inkey client.key -in client.crt -out client.p12
openssl pkcs12 -export -cacerts -inkey ca.key -in ca.crt -out ca.p12
```