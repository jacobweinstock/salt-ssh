## Salt-SSH in a Container
Run salt-ssh in a container. Create a file name `roster`. Use the roster.example file as a reference.

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