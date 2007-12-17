import io;
import socket;

public function(out int $exit_status) $.main = {
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
