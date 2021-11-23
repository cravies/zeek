event zeek_init() { 
  #tables are like dictionaries in python
	local x: table[count] of string = { [1] = "one", 
	                                    [3] = "three",
	                                    [5] = "five" };
	print x;
	x[7] = "seven";
	print "added 7 = seven";
	print x;
	print 7 in x; # T
	print x[7]; # seven
	delete x[3];
	print "deleted 3 = three";
	print x;
	print 3 !in x; # T
	x[1] = "1"; # changed the value at index 1

	for ( key in x ) {
		print key;
	}
}
