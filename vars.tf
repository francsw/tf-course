variable "Env" {
        default = "lab"
}

variable "uid" {
  description = "a unique username without spaces, which we need for these labs because resource not specific to a VPC will otherwise have naming conflicts. I will be using my initials in lower case: go"
        default = "FS"
}
variable "owner" {
        default = "Francois Swanepoel"
}

variable "ssh_source_cidr" {
        default = "202.37.198.1/32"
}
variable "testservercount" {
        default = 1
}