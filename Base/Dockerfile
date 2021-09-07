FROM ubuntu:bionic-20210702
LABEL authors="Selenium <ashida@nc-net.or.jp>"

#================================================
# Customize sources for apt-get
#================================================
RUN  echo "deb http://ports.ubuntu.com/ubuntu-ports/ bionic main universe\n" > /etc/apt/sources.list \
  && echo "deb http://ports.ubuntu.com/ubuntu-ports/ bionic-updates main universe\n" >> /etc/apt/sources.list \
  && echo "deb http://ports.ubuntu.com/ubuntu-ports/ bionic-security main universe\n" >> /etc/apt/sources.list

# No interactive frontend during docker build
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true
ENV TZ "UTC"
ENV HOME=/home/seluser

#======================================
# Add Grid check script
#======================================
COPY check-grid.sh entry_point.sh /opt/bin/

#======================================
# Add Supervisor configuration file
#======================================
COPY supervisord.conf /etc

#========================
# Miscellaneous packages
# Includes minimal runtime used for executing non GUI Java programs
#========================
RUN apt-get -qqy update \
  && apt-get -qqy --no-install-recommends install \
    bzip2 \
    ca-certificates \
    openjdk-11-jre-headless \
    tzdata \
    sudo \
    unzip \
    wget \
    jq \
    curl \
    supervisor \
    gnupg2 \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && sed -i 's/securerandom\.source=file:\/dev\/random/securerandom\.source=file:\/dev\/urandom/' ./usr/lib/jvm/java-11-openjdk-arm64/conf/security/java.security \
  && echo "${TZ}" > /etc/timezone \
  && dpkg-reconfigure --frontend noninteractive tzdata \
  && groupadd seluser \
         --gid 1201 \
  && useradd seluser \
         --create-home \
         --gid 1201 \
         --shell /bin/bash \
         --uid 1200 \
  && usermod -a -G sudo seluser \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'seluser:secret' | chpasswd \
  && mkdir -p /opt/selenium /opt/selenium/assets /var/run/supervisor /var/log/supervisor \
  && touch /opt/selenium/config.toml \
  && chmod -R 777 /opt/selenium /opt/selenium/assets /var/run/supervisor /var/log/supervisor /etc/passwd \
  && wget --no-verbose https://github.com/SeleniumHQ/docker-selenium/releases/download/4.0.0-rc-1-prerelease-20210713/selenium-server-4.0.0-prerelease-rc-1-74745cf081.jar \
    -O /opt/selenium/selenium-server.jar \
  && chgrp -R 0 /opt/selenium ${HOME} /opt/selenium/assets /var/run/supervisor /var/log/supervisor \
  && chmod -R g=u /opt/selenium ${HOME} /opt/selenium/assets /var/run/supervisor /var/log/supervisor

#===================================================
# Run the following commands as non-privileged user
#===================================================
USER 1200:1201


CMD ["/opt/bin/entry_point.sh"]
