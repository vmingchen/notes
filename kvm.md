# Install
https://fedoraproject.org/wiki/Getting_started_with_virtualization
http://www.server-world.info/en/note?os=CentOS_7&p=kvm&f=2
http://virt-tools.org/learning/install-with-command-line/
http://libvirt.org/drvqemu.html

    yum install virt-install libvirt-daemon-config-network libvirt-daemon-kvm
    systemctl start libvirtd

Install guest OS

    fallocate -l 10240M /var/lib/libvirt/images/guest1.img
    wget http://download.fedoraproject.org/pub/fedora/linux/releases/21/Workstation/x86_64/iso/Fedora-Live-Workstation-x86_64-21-5.iso
    chmod o+x /home/mchen
    virt-install -r 8192 --accelerate -n fed1 \
        -f /var/lib/libvirt/images/guest1.img \
        --cdrom /home/mchen/Fedora-Live-Workstation-x86_64-21-5.iso

# Manage
Console

    virsh console fed1

List and see info

    virsh list --all
    virsh nodeinfo [domain-id, domain-name or domain-uuid]

(Re)Connect to the hypervisor

    virsh --connect qemu:///system

Start a domain

    virsh --connect qemu:///system start fed1

Rename a VM:

    virsh dumpxml oldname > newname.xml
    vim newname.xml # to edit name between <name>oldname</name>
    virsh undefine oldname
    virsh define newname.xml

Undefine a domain

    virsh -c qemu:///system undefine fed1

Shutdown 

    virsh shutdown fed1
    virsh destroy fed1  # by force

Remove

    virsh undefine def1

Move from HostOS to GuestOS with a command:

    virsh console (name of virtual machine)

Move from GuestOS to HostOS by pressing "Ctrl+]"


Dump XML configuration file, and create using XML:

    virsh dumpxml [domain-id, domain-name or domain-uuid]
    virsh dumpxml GuestID > guest.xml
    virsh create configuration_file.xml

Clone

    virt-clone --original zk1.sgdp09 --name zk2.sgdp09 --file /home/zk2.img

Suspend/Resume/Reboot/Save/Restore/ a guest

    virsh suspend/resume/reboot [domain-id, domain-name or domain-uuid]
    
    virsh save [domain-id, domain-name or domain-uuid] filename
    virsh restore filename

# Configure
To configure the affinity of virtual CPUs with physical CPUs:

    virsh vcpupin [domain-id, domain-name or domain-uuid] [vcpu] , [cpulist]

configure CPU and memory

    virsh setvcpus [domain-name, domain-id or domain-uuid] [count]
    virsh setmem [domain-id or domain-name]  [count]

network

    virsh net-list
    virsh net-create/define/destroy/name/uuid/start/undefine ...

# Misc
Domain description file: /etc/libvirt/qemu/name.xml

# Network
http://wiki.libvirt.org/page/Networking
Show networks:

    brctl show 
