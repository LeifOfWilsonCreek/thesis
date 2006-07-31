import io;
import string;

public function(out int $exit_status) $.main = {
	private string(char, 1024) $in;
	private int $in_len;
	private auto $nums;

	loop: {
		// Pit strings are _not_ null-
		// terminated.  $in_len is an in-out
		// parameter.  Going in it's the
		// maximum length of $in and coming out
		// it's the actual length of $in.
		$in_len = sizeof($in);

		// _p means primitive.  => is the
		// method-call operator.
		$io.stdin=>readline_p($in, $in_len);

		// readline_p modified $in_len
		unless($in_len) break;

		$string.split($in, " ", $nums);

		// Convert the strings to integers.
		$string.2int($nums(0));
		$string.2int($nums(1));

		$io.stdout=>writef(
			"Sum is $sum\n",
			hash {
				"sum", $nums(0) + $nums(1),
			},
		);
	}

	$exit_status = 0;
}
