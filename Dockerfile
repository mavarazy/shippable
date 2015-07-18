FROM shippableimages/ubuntu1404_base

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list && \
	apt-get update && \
	apt-get install -y --force-yes mongodb-org=3.0.2 mongodb-org-server=3.0.2 mongodb-org-shell=3.0.2 mongodb-org-mongos=3.0.2 mongodb-org-tools=3.0.2 && \
	service mongod start && \

	echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
	echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections && \
	add-apt-repository ppa:webupd8team/java && \
	apt-get update && \
	apt-get install -y oracle-java8-installer && \

	wget www.scala-lang.org/files/archive/scala-2.11.6.deb && \
	dpkg -i scala-2.11.6.deb && \

	echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
	apt-get update && \
	apt-get install -y --force-yes sbt

CMD ["/bin/bash"]
