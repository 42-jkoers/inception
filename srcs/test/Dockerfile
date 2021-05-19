FROM debian

COPY a .
WORKDIR /root/

RUN touch "/tmp/b"

ENTRYPOINT [ "ln" ]
CMD [ "-s", "/tmp/b", "/root/b" ]
