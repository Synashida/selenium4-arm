# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NOTE: DO *NOT* EDIT THIS FILE.  IT IS GENERATED.
# PLEASE UPDATE Dockerfile.txt INSTEAD OF THIS FILE
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FROM ncnetwork/selenium4-node-base-arm:latest
LABEL authors="NCNetwork co., ltd."

USER root

#=========
# Firefox
#=========
ARG FIREFOX_VERSION=latest
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install firefox firefox-geckodriver libavcodec-extra \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* 

USER 1200

#============================================
# Dumping Browser name and version for config
#============================================
RUN echo "firefox" > /opt/selenium/browser_name