make sure ansible is installed via pip3

Install vagrant
vagrant is abstration layer on top of virtualbox, it has simple ini file that takes care of all the complexity

> brew tap hashicorp/tap
> brew install hashicorp/tap/hashicorp-vagrant


Install Virtualbox
download the dmg file and install

## check vagrant
> vagrant --version
> vagrant init geerlingguy/centos7

> vagrant up
the above command will download and run centos7

> vagrant ssh
> vagrant ssh-config

make sure you are in the folder from which you ran vagrant init

to shutdown the vm you can run
> vagrant halt
or
> vagrant destroy

## Run ansible via vagrant
add below in Vagrantfile
```
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yaml"
  end
```

run add ansible content to playbook.yaml
then run
> vagrant provision

once task is done destroy vagrant vm

For multi hosts, check hosts.ini

> ansible multi -i hosts.ini -a "hostname"

make sure you have ansible.cfg

if you want to run the hosts in parallel with -f
> ansible multi -i hosts.ini -a "hostname" -f 3

if you dont use module then by default command module is used then you can pass the command with -a

you can also run module
> ansible multi -i hosts.ini -m setup

Let's say you want to run install a package, you can do it via command line
> ansible multi -i hosts.ini -b -m yum -a "name=ntp state=present"

-b is BECOME, its like sudo root or become root


> ansible -i hosts.ini multi -b -m shell -a "tail /var/log/messages | grep ansible-command"


let's playbook to install apache and run apache
>ansible-playbook -i hosts.ini apache.yaml