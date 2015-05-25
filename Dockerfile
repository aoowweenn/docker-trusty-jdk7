FROM ubuntu:14.04
MAINTAINER Owen Chien <aoowweenn@gmail.com>
RUN echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' > /etc/apt/sources.list.d/webupd8team-java.list \
	&& echo 'deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' >> /etc/apt/sources.list.d/webupd8team-java.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
	&& echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections \
	&& echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections \
	&& apt-get update \
	&& apt-get install oracle-java7-set-default \
	&& apt-get clean \
	&& rm -rf /var/cache/oracle-jdk7-installer \
	&& rm -f /var/lib/apt/lists/*_dists_*
