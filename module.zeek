#main file main.zeek
@load factorial

event zeek_done() {
    local numbers: vector of count = vector(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);    
    for ( n in numbers ) {
    	print fmt("%d", Factor::factorial(numbers[n]));
	}
}
#module factorial.zeek
module Factor;

export {
    global factorial: function(n: count): count;
}
    
function factorial(n: count): count {
    if ( n == 0 ) {
        return 1;
    } else {
        return ( n * factorial(n - 1) );
    }
}
