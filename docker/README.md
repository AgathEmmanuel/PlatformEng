

## Commands 

```

You can change the port mapping by directly editing the hostconfig.json file at /var/lib/docker/containers/[hash_of_the_container]/hostconfig.json or /var/snap/docker/common/var-lib-docker/containers/[hash_of_the_container]/hostconfig.json, I believe, if You installed Docker as a snap.

You can determine the [hash_of_the_container] via the docker inspect <container_name> command and the value of the "Id" field is the hash.

    Stop the container (docker stop <container_name>).
    Stop docker service (per Tacsiazuma's comment)
    Change the file.
    Restart your docker engine (to flush/clear config caches). [ service docker restart ]
    Start the container (docker start <container_name>).
```
https://stackoverflow.com/questions/19335444/how-do-i-assign-a-port-mapping-to-an-existing-docker-container

## Docker basics
```
docker pull <image-name> 	# downloads the specified image from Docker Hub;
docker image ls 		    # lists all the downloaded images stored on your machine;
docker rmi <image-name> 	# removes the specified image from your machine;
docker run <image-name> 	# creates and runs a container using the specified image;
docker ps 			        # lists all the containers currently up;
docker ps -a 			    # lists all the containers, also the ones stopped;
docker stop <container-name> 	# stops the specified container;
docker start <container-name> 	# stops the specified container;
docker rm <container-name> 	    # stops and removes the specified container;

docker run -p 8089:80 image-name             # The -p flag maps the external and the internal ports, allowing us to access the container navigating to localhost:8089.When the container exposes the port 80, we can run.

docker pull mongo
docker image inspect mongo
docker run -d --name mongo-on-docker -p 27666:27017 -e MONGO_INITDB_ROOT_USERNAME=<username> -e MONGO_INITDB_ROOT_PASSWORD=<password> mongo
	# docker run runs the image and starts the container;
        # -d runs the container in background, so that we are free to use the current terminal instance;
        # --name mongo-on-docker defines a friendly name for the container;
        # -p 27666:27017 declares that the local port 27666 is mapped to the internal 27017 port;
        # -e MONGO_INITDB_ROOT_USERNAME=<username> sets the root username (-e sets the environment variables);
        # -r MONGO_INITDB_ROOT_PASSWORD=<password> sets the root password;
        # mongo is the name of the image to run;
	#   this create your connection string with this format: 
	#   mongodb://<username>:<password>@<host>:<port>/?authSource=admin. 
	#   You will get 
	#   mongodb://<username>:<password>@localhost:27666/?authSource=admin.

docker exec -it <MONGO_CONTAINER_NAME>  mongo		# to get a mongo shell
docker exec -it <MONGO_CONTAINER_NAME>  bash		# to get a bash shell

--- mongodb commands

show roles
db.createUser({ user: "newUser", pwd: "123123123", roles: [{ role: "readWrite", db: "dbTest" }] })
docker exec -it MONGO_CONTAINER mongo --username newUser --password 123123123 --authenticationDatabase dbTest

show dbs
use dbTest
db.createCollection('CollectionName')
db.CollectionName.insert({item: "name1", age: 10})
db.CollectionName.insert({item: "name2", age: 20})
db.CollectionName.find()
db.CollectionName.find({ item: "name1" })
db.CollectionName.find({ age: { $gt: 4 } })
db.CollectionName.find({ age: { $gt: 14 } })

show collections

```

https://www.mongodb.com/blog/post/running-mongodb-as-a-microservice-with-docker-and-kubernetes
https://dev.to/arantespp/mongodb-shell-commands-running-on-docker-101-1l73
https://www.surenderthakran.com/articles/tech/production-mongodb-using-docker

---
```

apt get install -y gzip vim tar git unzip wget

docker run -it --rm -v ${PWD}:/work -w /work --entrypoint /bin/sh directory/aws-cli:2.0.43

# here we run in iterative mode, mounts all files into the container into a working directory and set entrypong to sh and then run the aws cli command

```
---
```
docker attach   Attach local standard input, output, and error streams to a running container
docker build    Build an image from a Dockerfile
docker builder  Manage builds
docker checkpoint       Manage checkpoints
docker commit   Create a new image from a containers changes
docker config   Manage Docker configs
docker container        Manage containers
docker context  Manage contexts
docker cp       Copy files/folders between a container and the local filesystem
docker create   Create a new container
                creates a fresh new container from a docker image. However,
                it doesnt run it immediately.
docker start    start any stopped container. If you used docker create command to
                create a container, you can start it with this command.
docker run      is a combination of create and start as it creates a new container and
                starts it immediately. In fact, the docker run command can even pull
                an image from Docker Hub if it doesnt find the mentioned image on
                your system.
docker diff     Inspect changes to files or directories on a containers filesystem
docker events   Get real time events from the server
docker exec     Run a command in a running container
docker export   Export a containers filesystem as a tar archive
docker history  Show the history of an image
docker image    Manage images
docker images   List images
docker import   Import the contents from a tarball to create a filesystem image
docker info     Display system-wide information
docker inspect  Return low-level information on Docker objects
docker kill     Kill one or more running containers
docker load     Load an image from a tar archive or STDIN
docker login    Log in to a Docker registry
docker logout   Log out from a Docker registry
docker logs     Fetch the logs of a container
docker manifest         Manage Docker image manifests and manifest lists
docker network  Manage networks
docker node     Manage Swarm nodes
docker pause    Pause all processes within one or more containers
docker plugin   Manage plugins
docker port     List port mappings or a specific mapping for the container
docker ps       List containers
docker pull     Pull an image or a repository from a registry
docker push     Push an image or a repository to a registry
docker rename   Rename a container
docker restart  Restart one or more containers
docker rm       Remove one or more containers
docker rmi      Remove one or more images
docker run      Run a command in a new container
docker save     Save one or more images to a tar archive (streamed to STDOUT by default)
docker search   Search the Docker Hub for images
docker secret   Manage Docker secrets
docker service  Manage services
docker stack    Manage Docker stacks
docker start    Start one or more stopped containers
docker stats    Display a live stream of container(s) resource usage statistics
docker stop     Stop one or more running containers
docker swarm    Manage Swarm
docker system   Manage Docker
docker tag      Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
docker top      Display the running processes of a container
docker trust    Manage trust on Docker images
docker unpause  Unpause all processes within one or more containers
docker update   Update configuration of one or more containers
docker version  Show the Docker version information
docker volume   Manage volumes
docker wait     Block until one or more containers stop, then print their exit codes

```
https://docs.docker.com/engine/reference/commandline/docker/

https://docs.docker.com/config/containers/container-networking/

https://docs.docker.com/engine/swarm/admin_guide/

---
```
What is docker-machine?

https://www.macadamian.com/learn/docker-machine-basic-examples/

docker-machine -h               #can be used for playing with docker

docker-machine create -d virtualbox node1
                                #create a vm named node1

```
---
```
docker swarm -h
docker swarm --help

docker swarm leave              #node leaves the swarm

docker -h
docker swarm init -h
```
---

## docker build
```
docker build . -f docker/Dockefile -t my-rails-app:latest
                #The -f specifies the path to the actual Dockerfile, whereas the PATH (. in the example) tells Docker what to use for its context or current directory when building the image. (This is important when considering commands specifying files and paths within the Dockerfile.) The -t will tag the image built by Docker.

docker run -it --rm ruby:latest bash
                #The -it runs Docker interactively (so you get a pseudo-TTY with STDIN). The --rm causes Docker to automatically remove the container when it exits.


docker run -d -p 80:80 webserver /usr/sbin/apache2ctl -D FOREGROUND
                # -d   detached
                # -p   port 80 on stytem to port 80 on container
                # -D   ensures that the container is running even after the launch is complete

docker run -p 8080:3000 -e RACK_ENV=development my-rails-app:latest rails s
                #The -p defines the port mapping from the host to the container, and the -e defines key value pairs to set in the containers environment when it starts up. Multiple parameters can be provided:

docker run -it -rm -p 8080:3000 -p 8081:3001 -e RACK_ENV=development -e HOSTNAME=my-container my-rails-app:latest rackup


docker exec -it 90cdc54358fa bash
                #-it allows an interactive session. The container to run exec can either be specified by the container ID or the more friendly name that is generated or specified when the container is created.


    docker container ls to list all running containers
    docker container kill CONTAINER to forcefully stop a running container
    docker container rm CONTAINER to remove a container
    docker inspect CONTAINER to view detailed information about a running container

    docker image ls to list all locally available images
    docker image rm IMAGE to remove an image
    docker image prune to remove dangling images (those not attached to a container, or a dependency for an image that is)
    docker image prune -a to remove all images
    docker image tag IMAGE IMAGE to tag an image from one image id or tag, to a new tag. (e.g. my-app:latest to my-app:1.0.0)



```
Docker Tutorial for Beginners [FULL COURSE in 3 Hours]
https://youtu.be/3c-iBn73dDE

```
---installing docker on linux mint

sudo apt-get update
sudo apt-get upgrade
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker  #make sure it stays running after restart
sudo systemctl status docker
sudo reboot now
docker -v
docker info
sudo docker run hello-world
sudo apt install docker-compose
docker-compose version
docker container ls
docker exec container ls

if you met with permission denied when running docker commands
do the following
sudo groupadd docker
sudo gpasswd -a ${USER} docker
su - $USER
sudo reboot now



```
---
```
docker container ls -a --format "{{.Names}}"
                        #gives output of all contaienrs available
docker container ls -aq
                        #gives output with only container ids

docker run -itd --name ansible_master ubuntu /bin/bash
docker attach <container id>

hostname                #shows hostname

docker rename my_container my_new_container

---- on ansible master
sudo apt update
sudo apt install python ansible openssh-client vim iputils-ping -y

---- on ansible client
sudo apt update
sudo apt install python ssh vim -y
passwd root             #to set a password
vi /etc/ssh/sshd_config #you need to setup ssh passwordless login
                        #and so change prohibit-password in
                        #PermitRootLogin to yes

https://www.ssh.com/academy/ssh/keygen

service ssh restart
service ssh start

---- to find the ips
sudo docker network inspect bridge

# now try to ping the client machine from master machine
ping <client ip address>
ssh-keygen              #to generate ssh keys
ssh-copy-id root@<client ip address>
# now to enter the client ip inside ansibles inventory file
vi /etc/ansible/hosts
[machine]
client ip address

ansible -m ping <client ip addrss>
                        # m stands for module
                        # ping is a module in ansible


```
---
```

once we run an image a correspoding container is created
then you can simply use the existing container ids to start
and stop the container
docker ps -a            #to show all the containers

docker ps -aq           #to show only contaier ids
docker ps -s            #total file size of each container
dokcer ps -l            #to list the latest created containers



The ps command provides several columns of information:

    Container ID  a unique alphanumeric number for each container
    Image  The base operating system image the container is based on
    Command  The command that launched the container
    Created  How long ago the container was created
    Status  Uptime or downtime
    Ports  Specifies any ports forwarded to the container for networking
    Name  A memorable name assigned by the Docker software


The main command to launch or start a single or multiple stopped Docker containers is docker start:

docker start [options] container_id

You can specify the container by either using its name or ID (long or short).
To create a new container from an image and start it, use docker run:

docker run [options] image [command] [argument]

If you do not define a name for your newly created container, the deamon will generate a random string name. To define container name, use the name option:

docker run name=Ubuntu_Test ubuntu:14.04

The above mentioned command will create the Ubuntu_test container based on the ubuntu:14.04 image and start it.
A container may be running, but you may not be able to interact with it. To start the container in interactive mode, use the i and t options:

docker run it name=Ubuntu_Test ubuntu:14.04

In the above mentioned example, the system creates the Test_2 container from the ubuntu image, and connects to it enabling you to run commands directly on the container. Instead of using -i or -t options, use the attach command to connect to a running container:

docker attach container_id

Use the docker stop command to stop a container:

docker stop [option] container_id

Replace container_id with the containers name or ID.
By default, you get a 10 second grace period. The stop command instructs the container to stop services after that period. Use the --time option to define a different grace period expressed in seconds:

docker stop --time=20 container_id


To immediately kill a docker container without waiting for the grace period to end use:

docker kill [option] container_id

To stop all running containers, enter the following:

docker stop $(docker ps a q)

The same command could be used with kill. This would stop all containers without giving them a chance to exit.




Remove a Stopped Container
To remove a stopped container, use the command:

docker container rm [container_id]

Like before, this removes a container with the ID you specify.
Remove All Stopped Containers
To remove all stopped containers:

docker container rm $(docker container ls aq)

Remove All Docker Containers
To wipe Docker clean and start from scratch, enter the command:

docker container stop $(docker container ls aq) && docker system prune af volumes

This instructs Docker to stop the containers listed in the parentheses.
Inside the parentheses, you instruct Docker to generate a list of all the containers with their numeric ID. Then, the information is passed back to the container stop command and stops all the containers.

The && attribute instructs Docker to remove all stopped containers and volumes.
af indicates this should apply to all containers (a) without a required confirmation (f).



Removing Container With Filters

You can also specify to delete all objects that do not match a specified label.
To do so, use the command:

docker container prune filter=label!=maintainer=Jeremy

This command tells Docker to remove all containers that are not labeled with a maintainer of jeremy. The != command is a logical notation that means not equal to.

A breakdown of the label commands:

    label=<key>
    label=<key>=<value>
    label!=<key>
    label!=<key>=<value>

Using these terms in conjunction with labels gives you in-depth control over removing assets in Docker.
How to Remove Docker Images
Docker images are files, which include multiple layers used to run code within a container

Images may go through many iterations during development. Old and outdated images can clutter your system, taking up storage space and making searches more cumbersome.

1. To remove a Docker image, start by listing all the images on your system:

docker image ls

2. Make a note of the IMAGE ID  this is the identifier used to remove the image.
3. Then, remove the unwanted image(s):

docker image rm [image_id1] [image_id2]

Replace [image_id1] and [image_id2] with the image ID you pulled from the first command. You can enter a single Image ID, or multiple IDs for removal.
The system may respond to your request with an error message, that there is a conflict and it is unable to remove the repository reference. This indicates that a container is using the image. You need to remove the container first before you can remove the image.

Removing Docker Images With Filters
At the time of publication, the only supported filters are until and label. Still, these are powerful tools for managing Docker resources.
Use the until filter to remove all resources up to a given time.
Enter the following:

docker image prune a filter until=24h

This removes all (a) images created over the last 24 hours. The command can be used for containers, images, and filters. Make sure to specify the asset you want to remove.
The until command accepts Unix timestamps, date-formatted timestamps, or an amount of time (30m, 4h, 2h25m) calculated against the machine time.
Use the label command to remove assets defined by labels.
Enter the following:

docker image prune filter=label=old

This removes all docker images that have been labeled old.
Filtering can also be used to define a specific value of a label.
For example, if a container is labeled with a maintainer key, and the value of maintainer is either bill or jeremy, you can type:

docker container prune filter=label=maintainer=bill

Docker then removes all containers with the label maintainer with a value of bill.
How to Remove Docker Volumes
A volume is used to store Docker data.
It helps store and organize data outside containers in a way that its accessible to multiple containers.

1. Use the following command to generate a list of all the available Docker volumes:

docker volume ls

Take note of the VOLUME NAME you want to remove.
2. Then enter:

docker volume rm VolumeName

Make sure to replace VolumeName with the actual name you generated with the previous command. If the volume is in use by an existing container, the system responds with an error. This means need to remove the container first.



How to Remove Docker Networks

Docker networks allow different containers to communicate with each other freely while also preventing traffic from outside the network. This is typically done with a Docker bridge network.
The prune command removes all unused networks.
Removing a Single Network

1. Display a list of all existing Docker networks with the command:

docker network ls

2. Take note of the NETWORK ID  this is the identifier used to remove a specific network. Then, enter:

docker network rm [networkID]

Replace [networkID] with the ID you captured from the first command.
You may receive an error message that says the network has active endpoints. That means that the network is currently in use by containers. You need to remove the containers that are using the network before you can remove the network.
Remove All Unused Docker Objects

The prune command automatically removes all resources that arent associated with a container. This is a streamlined way to clean up unused images, containers, volumes, and networks.
In a terminal window, enter the following:

docker system prune

Additional flags can be included:

    a To include stopped containers and unused images
    f Bypasses confirmation dialog
    volumes Removes all unused volumes

Also, you can specify a single type of object to be removed, instead of the entire environment:

docker container prune

docker image prune

docker volume prune

docker network prune

Running docker system prune -a removes both unused and dangling images . Images used in a container, either currently running or exited, will NOT be affected.
List all Docker Resources

Enter the following commands to display resources:

docker container ls

docker image ls

docker volume ls

docker network ls

docker info

The above-mentioned lists number of containers, images, and information about the Docker installation. These commands can help you locate and identify resources that you want to keep, or that you want to delete.
The following flags can also be added:

    a display all of a resource (including the ones that are stopped)
    q or --quiet (display only the numeric ID)


```
---

https://labs.play-with-docker.com/

```
docker-compose version          #its installed in windows along with the
                                docker toolbox
docker-compose up -d            #runs the compose file in the local directory
                                in detached mode
docker-compose down             #brings everything down

docker swarm

# From one of your docker nodes you need to initialize the swarm
# and you will get a single node swarm in your docker desktop

docker swarm init

# However on play with docker and most other places you will have to specify
# the --advertise-addr flag , its telling Docker which of the host IPs to use
# for the cluster communication. In play with docker you can use 192.168.
# address. If you are in a private cloud like AWS or whatever,you should just
# use one of the instances private ips
# And we will get a swarm initialized and this node is the first manager

docker swarm init --advertise-addr=192.168.0.20


# To add a manager to swarm, since adding around 3 manager will ensure high
# availability
docker swarm join-token manager

# To add a worker node to swarm run this command in the leader manager node
# to generate to token along with the command
docker swarm join-token worker

# And this will give the command and token which you can run in the node
# machine

https://github.com/play-with-docker/play-with-docker/issues/65

Added new shortcut to copy with ctrl + alt + c. Couldn't change default pasting due
to browser permissions.
Also, just found that ctrl + insert (copy) and shitft + insert(paste) should also
work.




docker service create   #command to create a docker service this is only available in
                        swarm mode so if you have got docker  and you have not
                        initialized a swarm its not gonna work

docker service create --name web -p 8080:8080 --replicas 3 nigelpoulton/gsd:first-ctr

docker service ls

docker container ls

docker node ps $(docker node ls -q)     #list containers from all nodes of
                                        docker swarm mode

docker service ps redis         #shows all the tasks that are part of the redis service

docker service scale web=10     #this scales the web container to 10 service replicas

docker service ps web

docker container rm d0899lhnrif 9vupyhdxpqgo 90tudz3btw7z -f

docker container ls

docker service rm web

docker service ls


```
---
## stack
```

docker image build -t nigelpoulton/gsd:swarm-stack .

# when using docker desktop you have got this image locally and you have only
# one node but if your are running a multinode cluster like in production you
# want to make sure to push up the resultant image to a registry so that every
# node can access it

docker image push nigelpoulton/gsd:swarm-stack

docker stack deploy -c docker-compose.yml counter
                # here counter is the name of the resultant app

docker stack ls                         #show all stacks that are running
docker stack services counter           #to see each service in the stack
docker stack ps counter                 #to see each container in the stack


# so the result is we have got 10 service replicas running and
# the requests are being balanced across them all
# and also if you scale up and down your requests are being automatically
# balanced across any new containers added
# Note that this is layer 3 load balancing and its not application layer7 stuff

NOTE: the desired way to make changes to the no of replicas is
      by making the corresponding chane in the docker-compose.yml
      then do docker stack deploy command and docker understands its an
      an update to an existing stack and make those required bit of changes



```
---
https://docs.docker.com/engine/swarm/admin_guide/
```
docker swarm leave              #run this on a node to remove it from swarm


docker node update --availability drain <NODE>
                #To avoid interference with manager node operation, you can drain manager nodes to make them unavailable as worker nodes.When you drain a node, the scheduler reassigns any tasks running on the node to other available worker nodes in the swarm. It also prevents the scheduler from assigning tasks to the node.

docker node inspect manager1 --format "{{ .ManagerStatus.Reachability }}"
reachable
                #From the command line, run docker node inspect <id-node> to query the nodes. For instance, to query the reachability of the node as a manager


docker node inspect manager1 --format "{{ .Status.State }}"
ready
                #To query the status of the node as a worker that accept tasks

docker node ls

To cleanly re-join a manager node to a cluster:

    To demote the node to a worker, run docker node demote <NODE>.
    To remove the node from the swarm, run docker node rm <NODE>.
    Re-join the node to the swarm with a fresh state using docker swarm join.


docker node rm node9
                #Error response
docker node rm --force node9
                #f a node becomes unreachable, unresponsive, or compromised you can forcefully remove the node without shutting it down by passing the --force flag.

```
---
```
git clone https://github.com/nigelpoulton/gsd.git
docker image build -t username/gsd:first-ctr .
                        # -t stands for with terminal
                        # -it  stands for interactive and with terminal

docker image ls
docker image push username/gsd:first-ctr
docker image rm username/gsd:first-ctr

docker container run -d --name web -p 8080:8080 username/gsd:first-ctr

docker container run -d --name web -p 8080:8080 \
username/gsd:first-ctr

docker ps

docker stop <container id>
docker stop <container name>

docker container ls -a                  #gives more details


docker run -it python:rc-alpine3.13 sh
docker run -it openjdk:8-alpine sh
                        #in some images that we get the underlying os
                        will have sh instead bash so make sure to pass
                        in sh instead of bash
                        And note that exec is used when you have to
                        execute inside a running container and in this
                        case you could not run this as containers so
                        you run it and pass in sh
docker container run -it --name test alphine sh
                        #givs sh inside the container and runs container

docker contianer rm test -f     #forcefully removes the stops and removes
                                the container


```
---
## using a jenkins docker container
```
docker run -p 8080:8080 -p 50000:50000 -d -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

Here we are using a named volume which call as Jenkins_home and we are binding
it to directory inside Jenkins container under /var/Jenkins_home, this will
automatically create a volume, if you were to use a host volume here, which
basically means you take an already existing directory on your laptop machine
and bind it to the Jenkins container, you might get some permission issues,
meaning Jenkins user might not be able to write to the folder and that could
be a problem. And the reason why we need to create a volume for Jenkins is to
have data persistency for Jenkins. When we remove the container restart it and
recreate it  the data will still be there. And the reason why we need to
persist this data is because all the jenkin builds, all the configuration and
all the jenkin plugins and also the Jenkins users will be stored there. So
without this data you will have to reninitialize the whole Jenkins. Port 50000
is where Jenkins master and slave communicate.

```
---
```
docker network ls               #show the networks created by docker
docker logs <container id>      #show the logs of that particular container

docker network create mongo-network




```
---
```
installing docker on ubuntu VM

apt-get update && apt-get install -y docker.io
which docker
docker version          #shows version
ps -ef | grep dockerd   #shows the doker daemon running on your
                        system.
docker run -d --name nginx1 nginx
                        #run in dettached mode, which means your
                        output will not be attached to your shell
                        it will run in background, so this command
                        looks for the nginx image and if not found
                        locally will download and run.
docker inspect nginx1
docker inspect <container id>
curl <ip address of nginx conatiner>
                        #you will get output from nginx container
docker logs nginx1      #shows the logs
docker exec -it nginx1 bash
                        #will execute the command in the container
                        and you can open a terminal in the
                        container using the flag -it and exit to
                        come out of the images


docker exec -it nginx1 bash


docker images           #shows all the images
docker kill nginx1
docker ps -a            #list all processes that were running
docker system prune -a
                        #this deletes any images and files
                        associated with any non running containers
when you need external users to access you containers you can make
use of the pod mapping functionality of docker that maps the pod
inside your container to a pod on your host

docker run -d -p 8080:80 nginx
                        #8080 becomes the port on the host that is
                        the virtual machine which we map to the
                        port inside the container and 80 becomes
                        the port for our webserver nginx.
curl localhost:8080     #to access the webpage of nginx container

so no we are now able to access the page by using the private DNS
or our internal ip address. Or if we have an external ip address
asssociated with the VM we can globally use a browser to access
the VM at port 8080.

along with ports you can also associate volumes to your containers
to persist data. To a demo, we will just create a simple mysql
server and would attach a directory called as /data on the host
machine and will attach it to the location where /var/lib/mysql
(this is the location were databases like mysql typically store
the data of all the databases created)  inside the container.

docker run -v /data:/var/lib/mysql --name mysqldb -e MYSQL_ROOT_PASSWORD=<root password you want to assign> -d mysql
                        # -v flag will associate a directory on my
                        hostmachine and map it to the location
                        /var/lib/mysql inside the container.
                        Along with mysqldb we should also provide
                        an environment variable to the conataier
                        which is provided with the -e flag and
                        MYSQL_ROOT_PASSWORD variable will be used
                        by the docker container to get the root
                        passoword.

docker ps
docker exec -it mysqldb bash
cd /var/lib/mysql
ls -lt                  #you will find the exact same content that
                        was available on the /data
touch test              #this test file will also get created at
                        /data when executed from /var/lib/mysql
                        inside the container since these two
                        directories are now mapped.

```
---
```



docker machine restart default          :restart your environment
eval $(docker-machine env default)      :refresh your environment settings

docker ps                       : show all running containers
docker pull redis               : pulls the image of redis
docker run redis                : this will start the image in a container,
container is a running environment of an image, but this is actually where you
create a new container from an image





docker ps
docker kill <container Id> <container Id1> <container Id2>


docker run hello-world          #docker daemon pulls the hello-world image
                                from docker hum and creates a new
                                container from that image

https://nodejs.org/en/docs/guides/nodejs-docker-webapp/



Ctrl+c                    : to stop the container
docker run -d run redis   : runs the container in detached mode
docker ps
docker stop <container id>   : to stop the container
docker start <container id>  : to start container, here we deal with container
                                not images
docker ps -a                 : shows all containers which are
                               running or not running

NOTE:   -multiple containers can run on your host machine
        -your laptop has only certain ports available
        -you need to create a binding between a port your host
        machine has and the container
        -conflict occurs when same port on host machine is used
        -however you can have 2 containers both listening on same
        port but binded to different ports on your host machine
        -once the binding between the host and the container is
        already done, you can actually connect to the running
        container using the port of the host
        -without binding the containers will be ureachable by any
        of the application in the host
        -the way we do that is by specifying the binding of the
        ports while running the run command

docker run -p6000:6379 redis    : here 6000 is the host port
                                  and 6379 is the container port

docker logs <container id>
docker logs <conatiner name>
docker exec -it                 :to get a terminal of the containe
                                and run commands inside it
-it        :stands for interactive terminal

docker exec -it <container id> /bin/bash
                                :to ssh into container
                                :gives you the bash terminal
                                from inside the container.
                                then you can run
                                commands like ls,pwd,env,exit

docker exec -it <container id> /bin/sh
                                :if bash not available us sh shell
NOTE: You cannot use vim inside a docker container
https://blog.softwaremill.com/editing-files-in-a-docker-container-f36d76b9613c


docker run -d -p6001:6379 --name redis-older redis:4.0

-- name    :this option can be used to specify name to container
redis:4.0  :is the name of the image


docker rm <container id>        #to delet container
docker rmi <iamge id>           #to delet the image

docker build -t my-app:1.0

docker run my-app:1.0
```
---
```
---------demo project
-development
-CI/CD
-deployment

Developing a javascript application.
It uses a mongodb database and instead of installing it on your
laptop, you download a docker container from the docker hub.
You have developed the first version of the application locally and
now you want to test it or you want to deploy it on the development
environmnt where a tester and your team is going to test it.
You can make you JS application in git or other version control
system  that will trigger a continous intgration in jenkins fields
and whatever you have configured and jenkins field will produce
artifacts from your application.
So first you build JS app and then create docker image out of that.
Once its created by the jenkins it gets pulled to the docker repository
Usually a company would have a private repository and you dont want
other people to have access to your images.
Now the next steps could be configured on jenkins or some other scripts
or tools.That docker image have to be deployed on a development server.
Development server pulls the JS application image from the private
repsitory and also it pulls the docker image (on which you application
depnds on)  of mongo db from the
docker hub .

Docker network
Docker creates its own isolated docker network.
when we deploy some docker containers in the
same local network the can easily connect and talk to
eash other with just the container name.
Applications that run autside of the isoated docker network
is going to connect to them from outside using local host
port number . Later when you package your application into
a docker image we will also put an image of the external
application also in a container an put it along with
the other containers in ther isolated docker network. And
the browser which is running outside can connect to the
application using the hostname and the port number.


docker network ls               :shows the docker network
docker network create mongo network
                                :creates a netwok nameed mongo network


docker pull mongo

## create docker network
docker network create mongo-network

## start mongodb
docker run -d \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=password \
--name mongodb \
--net mongo-network \
mongo

## start mong-express
docker run -d \
-p 8081:8081 \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
--net mongo-network \
--name mongo-express \
-e ME_CONFIG_MONGODB_SERVER=mongodb \
mongo-express


docker logs <container id>



```
---
```
--------docker compose

mongo.yaml


version:'3'
services:
 mongodb:
   image:mongo
   ports:
    - 27017:27017
   environment:
    - MONGO-INITDB_ROOT_USERNAME=admin
    - MONGO-INITDB_ROOT_PASSWORD=password
 mongo-express:
   image: mongo-express
   ports:
    - 8080:8081
   environment:
    - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
    - ME_CONFIG_MONGODB_ADMINPASSWORD=password
    - ME_CONFiG_MONGODB_SERVER=mongodb


docker compose takes care of creating a common network
for all the containers in the same script


docker-compose -f mongo.yaml up
docker-compose -f mongo.yaml down


```
---
```
---------------dockerfile
--------------- Dockerfile

from node

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app

COPY . /home/app

CMD ["node","server.js"]


```
---
```
----------------- docker volumes

In usual case the data is gone, while restarting or removing
the container
Folder in pysical host file system is mounted into the virtual
file system of docker
Data gets automatically replicated.


docker run -v /home/mount/data:/var/lib/mysql/data

/home/mount/dat         :is the host directory
/var/lib/mysql/data     :is the container directory


you decide where on the host file system the referenc is made


docker run -v /var/lib/mysql/data

for each container a folder is generated automatically
that gets mounted. This voloumes are called anonymous volumes




```
---
```
---------ssh into docker machine

docker-machine ssh default

----------docker machine
http://docs.docker.oeynet.com/machine/get-started/#use-machine-to-run-docker-containers

docker-machine ls       :to list available machines
docker-machine create   :to create a new machine
docker-machine create --driver virtualbox default
                        :to create a new machine and name it as default if it is your first machine by select virtualbox as the drive since i am using toolbox on windows

docker-machine env default
                : to get the environment commands for your new VM

eval "$(docker-machine env default)"
                        : to connect your shell to new machine

docker-machine ip default  : shows ip address of default machine


```
---
```

docker images                   :list out images
docker-machine                  :
docker-machine active           :show active machines
docker-machine stop             :stops it
docker-machine stop default     :stops default

docker run -d -t --name newos1 centos
docker ps

docker exec -it newos1          #to ssh inot newos1

docker stop newos1



```
