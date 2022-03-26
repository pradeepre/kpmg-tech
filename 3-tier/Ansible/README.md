# kpmg-tech

## Requirements for Question 1
- Ansible 2.5+
- pyvmomi

## Steps for Question 1
```
cd kpmg-tech
Make necessary updates to hosts & ansible role file(deploy-rhcos-template/vars/main.yml)
ansible-playbook -i hosts vm_rhcos_provision.yml --extra-vars "folder=<Folder name>"
```

## Requirements for Question 2
- Running EC2 instance
- Python
- pipenv

## Steps for Question 2
```
cd kpmg-tech
python3 aws-metadata.py
```
