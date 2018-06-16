## Salt-SSH in a Container
Run salt-ssh in a container. Initially seeded with a docker formula.
* Create a file name `roster`. Use the roster.example file as a reference.
* Add any pillar data to `/srv/pillar`
* Add any salt formulas to `/srv/salt`
* Seed additional formulas by adding them to `/srv/pillar/deps.sls`

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
salt-ssh 'entry_in_roster' -i state.apply docker
```     

###### Source Repo
[https://github.com/jacobweinstock/salt-ssh](https://github.com/jacobweinstock/salt-ssh)

###### Docker Image
[https://hub.docker.com/r/jweinstock/salt-ssh/](https://hub.docker.com/r/jweinstock/salt-ssh/)    
`docker pull jweinstock/salt-ssh`
