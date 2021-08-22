# Template-Terraform-Cluster-Swarm-Production-Openstack
# Provider Openstack

Ce projet est le déploiement d'un cluster swarm à x noeuds dans un environnement openstack. L'architecture est composée d'un 1 noeud bastion, d'un (1) Loadbalancer et de x serveurs d'applications formant un cluster swarm.

## Pre-requis
* Environnement Openstack
* Mettre Octavia sur la valeur "true" dans le fichier provider pour l'approvisionnement du loadbalancer
* Définir le fichier comportant sa clé public pour l'injecter lors du déploiement (exemple : id_rsa.pub)

## Comment utilisé les fichiers ?

Vous devez cloner le projet : git clone https://github.com/enassar225/template-terraform-cluster-swarm-openstack puis creer un fichier terraform.tfvars pour y mettre vos variables lors du déploiement de l'infra.

## Exemple de fichier terraform.tfvars

#Nom de l'instance & l'id du flavor
* compute_bastion = {"SRV-BASTION" = "2"}
* computes_managers = {"MANAGER1" = "2", "MANAGER2" = "2", "MANAGER3" = "2"}
* computes_workers = {"WORKER1" = "2","WORKER2" = "2","WORKER3" = "2"}

#L'id de l'image
* image_id = "11b4ac46-74da-4e67-9ebd-5bf22a91d1f8"

#Le nom de la clé
* key_name = "KEY"

#Nom des groupes de sécurité
* secgroup_bastion_name = "GROUPE DE SECURITE BASTION"
* secgroup_swarm_name   = "GROUPE DE SECURITE SWARM"

#Les élements formant le réseau
* network_bastion_name = "NET-BASTION"
* subnet_bastion_name  = "SUBNET-BASTION"
* network_swarm_name   = "NET-SWARM"
* subnet_swarm_name    = "SUBNET-SWARM"
* external_net         = "public"
* external_net_id      = "8ff6c8e7-d609-4d7e-b05d-abebddbe3b8e"
* router_name = "ROUTER-SWARM"

#Nom du loadbalancer
* loadbalancer_name = "LB-SWARM"

