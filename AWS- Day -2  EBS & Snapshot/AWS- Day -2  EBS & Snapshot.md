# **Launch a t2.micro instance in Mumbai region where ssh can be done only from our IP address with docker and docker-compose installed in it.**

### Created EC-2 Instance t2.micro with defaults in Mumbai region with allow ssh from myIp
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/da303d0b-ad68-4526-ad72-7fdcca5e5b09)


### SSH login from myIP
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/4c964cd1-1541-4c9e-9a7a-fe7c6934c7b5)

## To Install Docker and docker-compose on our EC-2 Instance we use following
> ### Docker and docker compose prerequisites
```
sudo apt-get install curl
sudo apt-get install gnupg
sudo apt-get install ca-certificates
sudo apt-get install lsb-release
```
### Download the docker gpg file to Ubuntu
```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

### Add Docker and docker compose support to the Ubuntu's packages list

> The command to setup Docker and docker compose actually installs four pieces of software on Ubuntu:
Docker CE
The Docker CE command line interface
containerd
The docker compose plugin
sudo apt-get update

```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-pluginsudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-pluginlinux/ubuntu   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
 
### Install docker and docker compose on Ubuntu
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
 
### Verify the Docker and docker compose install on Ubuntu
```
sudo docker run hello-world
```

### Once we install Docker and docker compose, we can issue various commands in the terminal window. Popular commands to test the Docker setup on Ubuntu include:
```
sudo docker --version
docker compose version
sudo docker run hello-world
sudo docker images
sudo docker ps -a
```
### Outputs
### _Verification of Docker and Docker compose with running docekr hello world container_
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/6e22afea-ce6d-462c-a5d8-2951d00568ee)

###  _Running a Hello-world container_
![image](https://github.com/shivagorasa/DevopsZen/assets/97184376/48ce9e68-bc45-4b8d-8011-4c1906858f77)

# _Submission By Shiva Kumar Gorasa_


