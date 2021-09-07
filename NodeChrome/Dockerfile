# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NOTE: DO *NOT* EDIT THIS FILE.  IT IS GENERATED.
# PLEASE UPDATE Dockerfile.txt INSTEAD OF THIS FILE
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FROM ncnetwork/selenium4-node-base-arm:latest
LABEL authors=SeleniumHQ

USER root

#============================================
# Google Chrome
#============================================
# can specify versions by CHROME_VERSION;
#  e.g. google-chrome-stable=53.0.2785.101-1
#       google-chrome-beta=53.0.2785.92-1
#       google-chrome-unstable=54.0.2840.14-1
#       latest (equivalent to google-chrome-stable)
#       google-chrome-beta  (pull latest beta)
#============================================
ARG CHROME_VERSION="80.0.3987.163"
RUN apt-get update \
    && apt-get --assume-yes -qqy install software-properties-common \
    && add-apt-repository -y ppa:canonical-chromium-builds/stage \
    && apt-get --assume-yes -qqy install chromium-browser chromium-chromedriver

USER 1200

#============================================
# Dumping Browser name and version for config
#============================================
RUN echo "chrome" > /opt/selenium/browser_name