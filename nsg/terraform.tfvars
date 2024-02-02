sg = {
  sg1 = {
    name     = "internet"
    priority = "101"
    destination_port_range = 80
    protocol = "Tcp"
  },
  sg2 = {
    name     = "ssh"
    priority = "100"
    destination_port_range = 22
    protocol = "Tcp"
  }
}