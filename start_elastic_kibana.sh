docker ps -a|grep 'elasticsearch\|kibana'|awk '{print $1}'|xargs sudo docker kill
docker ps -a|grep 'elasticsearch\|kibana'|awk '{print $1}'|xargs sudo docker rm
docker-compose up -d
IP=$(docker inspect "elasticsearch"|grep -e \"IPAddress\"\:|cut -d '"' -f4)
HF=$(echo "$IP	elasticsearch")
echo $HF >> /etc/hosts
