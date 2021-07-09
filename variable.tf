#Swarm Manager
variable "managers_name" {
  default = []
}

variable "workers_name" {
  default = []
}

variable "bastion_name" {
  type = string
}

variable "nbre_managers" {
  type = number
}

variable "nbre_workers" {
  type = number
}

variable "image_id" {
  type = string
}

variable "flavor_managers_id" {
  type = string
}

variable "flavor_workers_id" {
  type = string
}

variable "flavor_bastion_id" {
  type = string
}

variable "key_name" {
  type = string
}

#Blockstorage
variable "size_glusterfs_workers" {
  type = number
}

#Network
variable "network_swarm_name" {
  type = string
}

variable "network_bastion_name" {
  type = string
}

variable "subnet_swarm_name" {
  type = string
}

variable "subnet_bastion_name" {
  type = string
}

#Router
variable "router_name" {
  type = string
}


#Secgroup
variable "secgroup_swarm_name" {
  type = string
}

variable "secgroup_bastion_name" {
  type = string
}

#Loadbalancer
variable "loadbalancer_name" {
  type = string
}
