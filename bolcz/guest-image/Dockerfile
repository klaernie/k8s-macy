FROM containerssh/agent:latest AS agent

FROM debian:13

LABEL org.opencontainers.image.source https://github.com/klaernie/k8s-macy

RUN echo "\e[1;32mUpdating packages and installing SFTP server package...\e[0m" && \
	DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confold' update && \
	DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confold' -fuy --allow-downgrades --allow-remove-essential --allow-change-held-packages upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confold' -fuy --allow-downgrades --allow-remove-essential --allow-change-held-packages dist-upgrade && \
	DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confold' -fuy --allow-downgrades --allow-remove-essential --allow-change-held-packages install ssh && \
	DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confold' -y autoremove && \
	DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::='--force-confold' -y clean

COPY --from=agent /usr/bin/containerssh-agent /usr/bin/containerssh-agent

RUN echo "creating user" && \
	useradd --uid 1000 --create-home --shell /bin/bash user
USER user

CMD ["/bin/bash"]
SHELL ["/bin/bash"]
ONBUILD RUN echo "This ContainerSSH guest image is not intended as a base image and may change at any time. Please build your own image." >&2 && exit 1

