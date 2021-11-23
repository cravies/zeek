event zeek_init()  { 
	local i : int = 0;
	while (i < 100 ) {
		if ((i%3)==0) {
			print i;
			print "fizz";
		} else if ((i%5)==0) {
			print i;
			print "buzz";
		}
		i = i + 1;
	}
}
