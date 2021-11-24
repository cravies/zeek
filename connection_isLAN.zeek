#determines if new connections are in a LAN defined by the networks in local_subnets
global local_subnets: set[subnet] = { 192.168.1.0/24, 192.68.2.0/24, 172.16.0.0/20, 172.16.16.0/20, 172.16.32.0/20, 172.16.48.0/20 };
global my_count = 0;
global inside_networks: set[addr];
global outside_networks: set[addr];

event new_connection(c: connection) {
    print fmt("The connection %s from %s on port %s to %s on port %s started at %s.", c$uid, c$id$orig_h, c$id$orig_p, c$id$resp_h, c$id$resp_p, strftime("%D %H:%M", c$start_time)); 
}

event connection_state_remove(c: connection) {
}

event zeek_done() {
	print "done!";
}
