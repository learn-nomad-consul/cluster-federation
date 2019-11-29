# demo multi DC

## Structure
- the vagrant file is used to create the VM infrastructure
- cloud-init folder contains the cloud-init files for each VM (to allow contextualization)
- the nomad & consul folders contains modules (think classes) and instances (think object)

Consul & nomad setups must be applied in corresponding DCs so for the conveniences, the host folders are mounted in "client" machines.

To start the demo stack :

```
vagrant up

```

you can also use the command below to start all machines in parallel, but beware of network, consul and nomad slight inconsitencies (you'll most liekly just have to restart the services if you encounter errors or strange behaviors)
```
grep config.vm.define Vagrantfile | awk -F'"' '{print $2}' | xargs -P8 -I {} vagrant up {}
```


to restart consul or nomad, run on the VM :
```
sudo systemctl restart consul

sudo systemctl restart nomad
```

