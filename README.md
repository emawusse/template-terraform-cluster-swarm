# Terraform-openstack-cluster-swarm
Ce projet est la configuration de l'approvisionnement d'un cluster swarm de n noeuds managers et n noeuds workers pour le provider Openstack. Les noeuds comportent également des volumes rattachés (disk) pour faire du pool de stockage si besoin.

## Pre-requis

* Environnement Openstack
* Mettre Octavia sur la valeur "true" dans le fichier provider pour l'approvisionnement du loadbalancer
* Définir le fichier comportant sa clé public pour l'injecter lors du déploiement (exemple : key.pub)

## Comment utilisé les fichiers ?

Vous devez cloner le projet : git clone https://github.com/enassar225/terraform-openstack-swarm puis creer un fichier terraform.tfvars pour y mettre vos variables lors du déploiement de l'infra.

Exemple du fichier terraform.tfvars: 

#Noeuds
- bastion_name = "BASTION"
- managers_name = ["MANAGER1"]
- workers_name  = ["WORKER1", "WORKER2", "WORKER3"]
- nbre_managers = 1
- nbre_workers  = 3

#Blockstorage
- size_glusterfs_workers = 50

#Compute.tf
- image_id           = "11b4ac46-74da-4e67-9ebd-5bf22a91d1f8"
- flavor_bastion_id  = "2"
- flavor_managers_id = "2"
- flavor_workers_id  = "2"
- key_name           = "enassar"

#Secgroup
- secgroup_swarm_name = "SECGROUP SWARM"
- secgroup_bastion_name  = "SECGROUP BASTION"

#Network
- network_swarm_name   = "NET-SWARM"
- network_bastion_name = "NET-BASTION-SWARM"
- subnet_swarm_name    = "SUBNET-SWARM"
- subnet_bastion_name  = "SUBNET-BASTION-SWARM"
- router_name          = "ROUTER-SWARM"

#Loadbalancer
- loadbalancer_name = "LB-SWARM"

