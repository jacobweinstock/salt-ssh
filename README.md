## Salt-SSH in a Container
Run salt-ssh in a container. Initially seeded with a [docker formula](https://github.com/salt-formulas/salt-formula-docker.git).
* Create a file name `roster`. Use the roster.example file as a reference. Map it into the docker container `-v ${PWD}/roster:/etc/salt/roster`.
* The container is setup to pull pillar data from git repo(s). Add the git repo to `/srv/pillar/deps.sls`.
* The container is setup to pull salt formulas from git repo(s). Add the git repo to `/srv/pillar/deps.sls`.

###### Build the image
```bash
docker build -t jweinstock/salt-ssh .
```
###### Run the image
```bash
docker run --rm -it -v $(pwd)/roster:/etc/salt/roster jweinstock/salt-ssh
```
###### Run salt-ssh commands
```sh
salt-ssh -i 'test' state.apply config
salt-ssh -i 'test' state.apply docker.host
```     

###### Source Repo
[https://github.com/jacobweinstock/salt-ssh](https://github.com/jacobweinstock/salt-ssh)

###### Docker Image
[https://hub.docker.com/r/jweinstock/salt-ssh/](https://hub.docker.com/r/jweinstock/salt-ssh/)    
`docker pull jweinstock/salt-ssh`
