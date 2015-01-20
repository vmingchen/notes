Open vSwitch notes

# Add bridge

        ovs-vsctl add-br mybridge
        ovs-vsctl del-br mybridge
        ovs-vsctl show
        ovs-vsctl add-port mybridge eth0

Now we use mybridge for outgress traffic

        ifconfig eth0 0     # clear IP address of IP
        dhclient mybridge   # get mybridge an IP via dhcp
        route -n            # see routing

Add tap ports

        ip tuntap add mode tap vport1
        ifconfig vport1 up
        ovs-vsctl add-port mybridge vport1
        ovs-appctl fdb/show mybridge    # show ip addresses of mybridge ports
        ovs-ofctl show mybridge
        ovs-ofctl dump-flows mybridge

OVS components

#see records in ovsdb-server tables

* VSWITCHD: userland
* OVSDB-SERVER: databse of OVS configurations (survives reboots)
* Kernel modules

        ovs-vsctl list Bridge       # shows tables in the OVSDB
        ovs-vsctl list Port         # shows ports
        ovs-vsctl list Interface    # shows interface

# mininet
An SDN controller is a network operating system

    mn --topo=linear.2
    sudo mn -c      # clear states; good before starting a new experiment
    mininet> h1 ifconfig
    mininet> h2 ping h3
    mininet> xterm h2
    mininet> pingall
    mininet> iperf
    
    sudo mn --link tc,bw=10,delay=10ms  # 10Mbit/s and 10ms extra delay
    sudo mn --topo=tree,2,2

# Open vSwitch
http://openvswitch.org/pipermail/discuss/2010-November/004536.html
http://blog.scottlowe.org/2012/10/31/layer-3-routing-with-open-vswitch/

Install:
https://n40lab.wordpress.com/2014/09/04/openvswitch-2-3-0-lts-and-centos-7/
