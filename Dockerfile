FROM alpine:3.16

ENV MESSAGE="Hello World"

CMD ["/bin/sh", "-c", "echo $MESSAGE"]