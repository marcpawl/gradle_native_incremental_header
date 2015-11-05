FROM debian:8.2
RUN apt-get -y update && apt-get install -y \
  curl \
  g++ \
  gcc  \
  openjdk-7-jdk \
  unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN  \
    curl -O https://downloads.gradle.org/distributions/gradle-2.8-bin.zip \
    && unzip gradle-2.8-bin.zip && rm gradle-2.8-bin.zip
    
COPY code /code
