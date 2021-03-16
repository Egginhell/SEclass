FROM ubuntu:20.04

RUN apt update && apt install -y openssh-server
RUN apt -y install vim

RUN mkdir /var/run/sshd

RUN echo 'root:mypassword' | chpasswd

RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i 's@session/s*required/s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd


ENV NOTVISIBLE="in users profile"

RUN echo "export VISIBILE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

git config — global user.name MyeongHun

git config — global user.email audgns0636@naver.com

