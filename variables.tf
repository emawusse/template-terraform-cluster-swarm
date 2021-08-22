#Swarm Noeuds
variable "compute_bastion" {
  default = []
}

variable "computes_managers" {
  default = []
}

variable "computes_workers" {
  default = []
}

variable "image_id" {
  default = []
}

variable "key_name" {
  default = []
}

#Network
variable "network_bastion_name" {
  default = []
}

variable "subnet_bastion_name" {
  default = []
}

variable "network_swarm_name" {
  default = []
}

variable "subnet_swarm_name" {
  default = []
}

#Router
variable "router_name" {
  default = []
}

variable "external_net" {
  default = []
}

variable "external_net_id" {
  default = []
}

#Secgroup
variable "secgroup_bastion_name" {
  default = []
}

variable "secgroup_swarm_name" {
  default = []
}

#Loadbalancer
variable "loadbalancer_name" {
  default = []
}
