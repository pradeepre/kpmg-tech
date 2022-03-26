# My Ansible code to deploy infrastructure in VMWare

## Requirements for Question 1
- Ansible 2.5+
- pyvmomi

## Steps
```
cd kpmg-tech/3-tier/Ansible
Make necessary updates to hosts & ansible role file(deploy-rhcos-template/vars/main.yml)
ansible-playbook -i hosts vm_rhcos_provision.yml --extra-vars "folder=<Folder name>"
```
