# a record is like a struct in C
type triangle: record {
	#set a triangle with sides a, b, and hypotenuse c
	a: double;
	b: double;
	c: double;
};

#check if a triangle is right angled
function is_right_angle(s: triangle): bool {
	#does a^2 + b^2 = c^2?
	local c_calc : double = sqrt((s$a*s$a) + (s$b*s$b));
	return (c_calc==s$c);
}

event zeek_init() { 
	local my_tri = triangle($a = 3.0, $b = 4.0, $c = 5.0);
	if (is_right_angle(my_tri)) {
		print "Triange is right angled.";
	} else {
		print "Triangle is not right angled.";
	}
}
