FROM swift-jupyter:latest

COPY requirements.txt ./

RUN pip2 install -r requirements.txt
RUN pip3 install -r requirements.txt

RUN apt-get update && apt-get install -y vim sudo less
RUN useradd -ms /bin/bash developer -p "$(openssl passwd -1 developer)" && echo "developer ALL=(ALL) ALL" > /etc/sudoers.d/developer
RUN echo "export PATH=$PATH:/swift-tensorflow-toolchain/usr/bin" >  /etc/profile.d/90-swift-path.sh

################################# ssh server ###################################
# ssh server + key for root
#
# To use Host's host keys, map /etc/sshd:/etc/secret:readonly
# To connect as root:
# ssh root@HOST -p 8022 -o  -i swift-jupyter.rsa
#
COPY ./swift-jupyter.pub /root
RUN apt-get install -y ssh; \
    mkdir -p /run/sshd; \
    mkdir /root/.ssh ; \
    mv /root/swift-jupyter.pub /root/.ssh/authorized_keys2 ;\
    ln -s /root/.ssh/authorized_keys2 /root/.ssh/authorized_keys; \
    chmod go-rwx -R /root/.ssh ;\
    sed -i 's@#HostKey /etc/ssh@HostKey /etc/secret@' /etc/ssh/sshd_config ;\
    sed -i 's@#X11UseLocalhost yes@X11UseLocalhost no@' /etc/ssh/sshd_config ;\
    mkdir -p /etc/secret

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-e"]