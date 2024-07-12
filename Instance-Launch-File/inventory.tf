resource "local_file" "inventory-file" {
    filename = "ansible-inventory"
    content = templatefile("inventory.tpl",{
        node01 = aws_instance.public_instance2.public_ip
        node02 = aws_instance.public_instance3.public_ip
    })
}