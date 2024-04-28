FROM mysql:latest

LABEL maintainer="Soe Thura <thixpin@gmail.com>"
LABEL description="This is a Dockerfile to use as database server node for Ansible."

# Install openssh-server on orcalelinux
RUN microdnf install openssh-server 

# CREATE SSH DIRECTORY for root user
RUN mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh && \
    touch /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys && \
    ssh-keygen -A

# Run sshd and mysql in the foreground
CMD ["sh", "-c", "/usr/sbin/sshd &&  mysqld"]