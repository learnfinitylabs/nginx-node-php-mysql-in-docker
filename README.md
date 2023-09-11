
# Nginx, Node, PHP, MySQL in Docker

We will be looking into how to install Nginx, Node, PHP and MySQL in docker to set up our local development environment.

We will also be setting up the correct user and group for Nginx and PHP-FPM so we do not encounter any permission issues when developing and runnirg our application.

## Environment Variables

To run this project, you will need to edit the following environment variables to your .env file. Please note that when you are on a windows machine, use the forward slash / instead of the backslack \ for the directory separator (e.g. D:/code/my-docker).

`HTML_HOST_ROOT_DIRECTORY`

`NGINX_HOST_ROOT_DIRECTORY`

`PHP_HOST_ROOT_DIRECTORY`

`MYSQL_HOST_ROOT_DIRECTORY`

## Installation

Create a folder somwhere in your local machine, then launch terminal, make sure to navigate inside your newly created folder, then execute:

```bash
  git clone https://github.com/learnfinitylabs/nginx-node-php-mysql-in-docker.git .
```
Make sure that the docker desktop is launched, then in your terminal, navigate inside the docker folder, then type:

```bash
  docker-compose up -d
```
    
## Acknowledgements

 - [Docker - Develop faster. Run anywhere.](https://www.docker.com/)
- [Fixing permissions issues with Docker Compose and PHP](https://aschmelyun.com/blog/fixing-permissions-issues-with-docker-compose-and-php/)


