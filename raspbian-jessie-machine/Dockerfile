FROM aacebedo/raspbian-jessie-minbase
ENV user admin

RUN apt-get update -y
RUN apt-get install wget ssh vim-athena zsh curl git -y
RUN  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" | true
RUN useradd -m $user
RUN echo "$user:$user" | chpasswd
RUN mkdir -p /home/$user/.ssh

ADD files/init-fake.conf /etc/init/fake-container-events.conf
RUN dpkg-divert --rename --remove /sbin/initctl
RUN /usr/sbin/update-rc.d -f ondemand remove; \
for f in \
       /etc/init/u*.conf \
       /etc/init/mounted-dev.conf \
       /etc/init/mounted-proc.conf \
       /etc/init/mounted-run.conf \
       /etc/init/mounted-tmp.conf \
       /etc/init/mounted-var.conf \
       /etc/init/hostname.conf \
       /etc/init/networking.conf \
       /etc/init/tty*.conf \
       /etc/init/plymouth*.conf \
       /etc/init/hwclock*.conf \
       /etc/init/module*.conf\
    ; do dpkg-divert --local --rename --add "$f"; \
   done; \
   echo '# /lib/init/fstab: cleared out for bare-bones Docker' >  /lib/init/fstab

RUN echo "$user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN echo 'root:root' | chpasswd

EXPOSE 22


CMD ["/sbin/init"]

