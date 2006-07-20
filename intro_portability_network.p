import io;
import socket;

public function(out int $exit_status) $.main = {
	// All the parameters can be combined into a single hash, greatly
	// simplifying the library interface.  Also, either the integer
	// 0x7f000001 or the string "127.0.0.1" may be specified, because the
	// library can tell which it is and do the necessary conversion.  As
	// should have been done in C's libraries, endian conversions for port
	// and network numbers are always done by the library -- so no htons().
	// We don't need to initialize anything because a hash keeps track of
	// which values are initialized.

	private auto $s;
	$socket.connect($s, hash {
		"family", "inet",
		"type", "stream",
		"laddress", "127.0.0.1",
		"raddress", "127.0.0.1",
		"rport", 22,
	});

	private auto $buf;
	$s=>readline($buf);
	$io.stdout=>write($buf);

	return 0;
}
