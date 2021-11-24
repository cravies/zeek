global local_subnets: set[subnet] = { 192.168.1.0/24, 192.68.2.0/24, 172.16.0.0/20, 172.16.16.0/20, 172.16.32.0/20, 172.16.48.0/20 };
global my_count = 0;
global inside_networks: set[addr];
global outside_networks: set[addr];

event new_connection(c: connection) {
	#print info about the first 10 connections
	if (my_count < 10) {
		print fmt("New connection. ID %s", c$uid);
		print fmt("Source ip & port: %s %s", c$id$orig_h, c$id$orig_p);
		print fmt("Destination ip & port: %s %s", c$id$resp_h, c$id$resp_p);
		print fmt("Connection started at: %s", strftime("%D %H:%M", c$start_time));
		print fmt("Connection number %s", my_count);
	}
	my_count=my_count+1;
}

event connection_state_remove(c: connection) {
}

event zeek_done() {
	print fmt("total number of connections: %s", my_count);
	print "done!";
}

