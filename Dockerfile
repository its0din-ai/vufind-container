FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php \
    php-mbstring \
    php-pear \
    php \
    php-dev \
    php-gd \
    php-intl \
    php-json \
    php-ldap \
    php-mysql \
    php-xml \
    php-soap \
    php-curl \
    openssh-server \
    net-tools \
    nano \
    sudo \
    lsof \
    mysql-server \
    default-jdk
    
RUN adduser --disabled-password --gecos "" vufind && \
    echo 'vufind:vufind' | chpasswd

RUN groupadd admin && \
    usermod -aG admin vufind

RUN a2enmod rewrite && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN mkdir /var/run/sshd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo "root:toor" | chpasswd && \
    ssh-keygen -A

RUN mkdir /nonexistent

RUN wget -O /tmp/vufind-9.0.3.tar.gz https://github.com/vufind-org/vufind/releases/download/v9.0.3/vufind-9.0.3.tar.gz
RUN tar -xzf /tmp/vufind-9.0.3.tar.gz -C /tmp/
RUN sudo mv /tmp/vufind-9.0.3 /usr/local/vufind

COPY ./assets/entrypoint.sh /
COPY ./assets/configsql.sh /usr/local/bin/

RUN chmod +x /entrypoint.sh && \
    chmod +x /usr/local/bin/configsql.sh

EXPOSE 80 22 3306

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
