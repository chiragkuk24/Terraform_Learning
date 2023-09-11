variable "server_details"{
    type    = map
    default = {
        "server1"   =   {
            "name"  =   "jenkins"
            "keypair"   =   "NVirgina-ForLinux"
        }
        "server2"   =   {
            "name"  =   "ansible"
            "keypair"   =   "NVirgina-keypair"
        }
    }
}