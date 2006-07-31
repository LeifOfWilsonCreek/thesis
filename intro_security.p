import io;
import string;

public function(out int $exit_status) $.main = {
	private auto $in, $nums;

	// $io.stdin is a global symbol.  => is
	// the method-call operator.  readline
	// is the name of the method that reads
	// a line of input.  The line is stored
	// in $in and returned.  Dots are
	// simply part of a symbol's name
	// indicating its namespace.
	while($io.stdin=>readline(ret $in)) {
		// $string.split() is a function that
		// splits $in on " " and stuffs the
		// result into $nums as an array of
		// strings.
		$string.split($in, " ", $nums);

		// Convert the strings to integers.
		$string.2int($nums(0));
		$string.2int($nums(1));

		// The object $io.stdout has a method
		// called writef that is semantically
		// analogous to C's printf().
		$io.stdout=>writef(
			"Sum is $sum\n",
			hash {
				"sum", $nums(0) + $nums(1),
			},
		);
	}

	$exit_status = 0;
}
