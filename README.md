# kpmg-tech

## Requirements for Question 1
- Ansible 2.5+
- pyvmomi

## Steps for Question 1
```
cd kpmg-tech
ansible-playbook -i hosts vm_rhcos_provision.yml --extra-vars "amd_vsphere_folder=<Folder name>"
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
