# Whoogle-docker
Whoogle(https://github.com/benbusby/whoogle-search) docker container that saves space and is a little cleaner to look at
## How To
### Pre Reqs
Ya need docker

1.Clone repo 

2.`docker build -t victim/whoogle .` 

3.`docker run --name=whoogle -d -p 8080:5000 victim/whoogle` 

### Upcoming

Config save location

Image on docker hub so y'all won't have to prune the huge build images
