# demo multi DC

## Structure
- the vagrant file is used to create the VM infrastructure
- cloud-init folder contains the cloud-init files for each VM (to allow contextualization)
- the nomad & consul folders contains modules (think classes) and instances (think object)

Consul & nomad setups must be applied in corresponding DCs so for the conveniences, the host folders are mounted in "client" machines.


```
vagrant up

```

maybe add the datacenter param to nomad agents :
`datacenter = "client1"`

```
grep config.vm.define Vagrantfile | awk -F'"' '{print $2}' | xargs -P8 -I {} vagrant up {}
```
