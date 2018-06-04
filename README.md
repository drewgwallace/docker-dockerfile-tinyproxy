# Docker Dockerfile


## Purpose
  Dockerfile to create a very basic proxy server in Docker.
  
----

## Execution

### docker hub <br> https://hub.docker.com/r/drewgwallace/tinyproxy/
<pre>
    docker run -p 8888:8888 -dt drewgwallace/tinyproxy:latest
</pre>
### Build yourself with docker compose
<pre>
    git clone https://github.com/drewgwallace/docker-dockerfile-tinyproxy.git
    cd docker-dockerfile-tinyproxy
    docker build -t <b>USERNAME/RESPOSITORY</b>:squid_server .
    docker push <b>USERNAME/RESPOSITORY</b>:squid_server
    <b>(Edit the docker-compose.yml with your repository)</b>
    docker stack deploy -c docker-compose.yml tinyproxy_stack --with-registry-auth
</pre>   


----

## Notes
+ Be sure to edit docker-compose.yml with your repository information.
+ There is an alternative Dockerfile.ubuntu if you prefer a Ubuntu base image.
+ When building if you receive the error:

      [Warning] IPv4 forwarding is disabled. Networking will not work.
      
  + You will need IPv4 forwarding, run this command:

        sudo sysctl -w net.ipv4.ip_forward=1
