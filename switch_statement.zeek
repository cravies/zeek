event zeek_init() { 
	local vowels = 0;

	local test : string = "The quick brown fox";

	for (char in test) {
		switch ( char ) {
			case "a", "e", "i", "o", "u":
			    # This block only executes if the char is a vowel.	
			    print char + " is a vowel.";
			    vowels = vowels + 1;
			    break;
			default:
			    # This block executed if no other case matches.
			    print char + " is not a vowel.";
			    break;
		}
	}  
	print vowels;
}
