# Description
- This is the official documentation of this project.
- This project is assigned by Simplilearn on `Learn DevOps Basics Skill` course. It is a free course with completion certificate.
- Link to course in [Simplilearn](https://www.simplilearn.com/learn-devops-basics-skillup).
- In project 1, we practice DevOps using Docker, Node.js, Angular-CLI and Linux(Ubuntu) as a base image for Dockerfile and lastly but not least use `docker-compose` to manage docker container.

# Methodology
## `Intellij Ultimate` as Idle.
   - Install it on your own.
   - Create new project and select on `Angular CLI` and named the project according to your choice. Press `Create`.
   - Wait until the Intellij create the default angular project for you.
   - Once Intellij completely generated the source code, open the terminal inside the project directory. And enter `ng serve` to compile and run the project.
   - By default, the project runs on `Port 4200`. 
   - Visit [http://localhost:4200](http://localhost:4200) on your browser to open the project.
   - Once project runs successfully, now enter `ng build` command to build the project. The build artifacts will be stored in `dist/` directory.


## Docker and Docker-compose
  - Enter `sudo apt install -y docker.io docker-compose` to install `docker` and `docker-compose` in your `ubuntu` distro.
  - Then enter `sudo usermod -aG docker $USER` to add your current user in docker group.
  - Then enter `newgrp docker` to relist the user in `docker` group.
  - `Docker` and `docker-compose` is now available in your system.

## Dockerfile of the project
  - In the Intellij inside the project folder, create a empty file named as `Dockerfile`. Enter the below command:
    ````
    # stage 1
    FROM node:latest as node
    WORKDIR /app
    COPY . .
    RUN npm install
    RUN npm run build --prod
    
    # stage 2
    FROM ubuntu/nginx
    COPY --from=node /app/dist/simplilearn-dev-ops-project1-angular /var/www/html
    ````
  - Open terminal, build docker image from the above Dockerfile. Command to build: 
    ````
    docker build -t $IMAGE_NAME:$TAG -f Dockerfile .
    ````
  - Remember to change the `$IMAGE_NAME` and `$TAG` with the desire name and version of the image.

## Docker Hub
- Docker Hub is a popular and public registry for the docker images.
- Command to push the docker image in docker hub: 
  `docker push $IMAGE_NAME:$TAG`
- Docker image of this project can be found in Docker Hub under my account.
- [Link](https://hub.docker.com/repository/docker/thespiritman/simplilearn-devops-project1-angular) to the image of this project in Docker Hub. 

## Run Angular application using Docker image.
- Open terminal. Enter command:
  `docker run -d -p 8080:80 --name=$CONTAINER_NAME $IMAGE_NAME:TAG`
- Using `-d` flag will run the container in detached mode.
- Using `-p` flag will publish the port of the container.
- Using `--name` flag will assign custom_name to a container.
- Change `$IMAGE_NAME`,`$TAG` and `$CONTAINER_NAME` with the docker image name,its tag and assign the container name according to your wish.
- Visit [http://localhost:8080](http://localhost:8080) on your browser to open the project. Remember this webpage in open using your container.
