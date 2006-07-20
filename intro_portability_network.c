#include <string.h>
#include <sys/types.h>
#include <unistd.h>

/* Network-related includes */
#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/socket.h>

int main() {
	struct sockaddr_in my_addr, their_addr;
	int sockfd;
	char buf[1024];
	ssize_t ssz;

	/* Prepare my_addr and their_addr, which are temporary structs passed
	 * to bind() and connect().  Notice the very important, but easily
	 * forgotten call to memset().  This is required because
	 * implementations may add optional fields, and we must pass zero for
	 * these, not an uninitialized value. */
//	memset(&my_addr, 0, sizeof(my_addr));
//	my_addr.sin_family = AF_INET;
//	my_addr.sin_addr.s_addr = inet_addr("127.0.0.1");

	memset(&their_addr, 0, sizeof(their_addr));
	their_addr.sin_family = AF_INET;
	their_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
	their_addr.sin_port = htons(22);

	/* Open socket */
	if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1) { perror("socket"); return 1; }
//	if(bind(sockfd, (struct sockaddr *)&my_addr, sizeof(my_addr))) { perror("bind"); close(sockfd); return 1; }
	if(connect(sockfd, (struct sockaddr *)&their_addr, sizeof(struct sockaddr))) { perror("connect"); close(sockfd); return 1; }

	memset(buf, 0, sizeof(buf));
	if((ssz = read(sockfd, buf, sizeof(buf))) == -1) { perror("read"); close(sockfd); return 1; }
	if(write(STDOUT_FILENO, buf, ssz) < ssz) { perror("write"); close(sockfd); return 1; }
	if(close(sockfd)) { perror("remote close"); return 1; }
	if(close(STDOUT_FILENO)) { perror("stdout close"); return 1; }

	return 0;
}
