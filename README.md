# Terraform-Cluster-Nextcloud-Openstack
# Provider Openstack

Ce projet est le déploiement d'un cluster swarm à x noeuds dans un environnement openstack. L'architecture est composée d'un 1 noeud bastion et de x serveurs d'application formant un cluster swarm. Les noeuds applicatifs comportent également des volumes rattachés (disk) pour faire du pool de stockage si besoin.

## Pre-requis

* Environnement Openstack
* Mettre Octavia sur la valeur "true" dans le fichier provider pour l'approvisionnement du loadbalancer
* Définir le fichier comportant sa clé public pour l'injecter lors du déploiement (exemple : key.pub)

## Comment utilisé les fichiers ?

Vous devez cloner le projet : git clone https://github.com/enassar225/template-terraform-cluster-swarm-openstack puis creer un fichier terraform.tfvars pour y mettre vos variables lors du déploiement de l'infra.

## Exemple de fichier terraform.tfvars

* compute_bastion = {"SRV-BASTION" = "2"}
* computes_managers = {"MANAGER1" = "2", "MANAGER2" = "2", "MANAGER3" = "2"}
* computes_workers = {"WORKER1" = "2","WORKER2" = "2","WORKER3" = "2"}
* image_id = "11b4ac46-74da-4e67-9ebd-5bf22a91d1f8"
* key_name = "KEY"

* secgroup_bastion_name = "GROUPE DE SECURITE BASTION"
* secgroup_swarm_name   = "GROUPE DE SECURITE SWARM"

* network_bastion_name = "NET-BASTION"
* subnet_bastion_name  = "SUBNET-BASTION"
* network_swarm_name   = "NET-SWARM"
* subnet_swarm_name    = "SUBNET-SWARM"
* external_net         = "public"
* external_net_id      = "8ff6c8e7-d609-4d7e-b05d-abebddbe3b8e"
* router_name = "ROUTER-SWARM"

* loadbalancer_name = "LB-SWARM"

