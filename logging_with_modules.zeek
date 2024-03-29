#main.zeek
@load factorial

event zeek_init() {
    # Create the logging stream.
    Log::create_stream(Factor::LOG, [$columns=Factor::Info, $path="factor"]);
}

event zeek_done() {
    local numbers: vector of count = vector(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);    
    for ( n in numbers ) {
        Log::write( Factor::LOG, [$num=numbers[n],
                                  $factorial_num=Factor::factorial(numbers[n])]);
    }
}

#factorial.zeek
module Factor;

export {
    # Append the value LOG to the Log::ID enumerable.
    redef enum Log::ID += { LOG };

    # Define a new type called Factor::Info.
    type Info: record {
        num:           count &log;
        factorial_num: count &log;
        };
    global factorial: function(n: count): count;
}
    
function factorial(n: count): count {
    if ( n == 0 ) {
        return 1;
    } else {
        return ( n * factorial(n - 1) );
    }
}
