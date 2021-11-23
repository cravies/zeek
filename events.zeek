global myevent: event(s: string);

global n = 0;

# this event is low priority and will be executed second
event myevent(s: string) &priority = -10 {
	++n;
}

#this event is high priority and will be executed first.
event myevent(s: string) &priority = 10 {
	print "myevent", s, n;
}

event zeek_init() {
	print "zeek_init()";
	
	#first this will call the high priority my_event, which will print
	#my_event hi 0
	#then the low priority my_event will trigger, incrementing n to 1.
	event myevent("hi");
	#wait 5 seconds, then set s to "bye" while calling my_event
	#this will print my_event bye 1
	#and then increment n to 2
	schedule 5 sec { 
		myevent("bye") 
	};
}

event zeek_done() {
	print "this will be 2.";
	print n;
	print "zeek_done()";
}
