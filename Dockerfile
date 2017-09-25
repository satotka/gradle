FROM openjdk:8-jre-alpine

ARG GRADLE_VERSION=4.1
ARG GRADLE_URL=https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip

# install wget with ca
RUN apk update && \
    apk add ca-certificates wget && \
    update-ca-certificates

# Install gradle
RUN wget -q ${GRADLE_URL} -O /gradle.zip && \
    unzip gradle.zip && \
    rm gradle.zip

# set environmnets
ENV GRADLE_HOME=/gradle-${GRADLE_VERSION}
ENV PATH=$PATH:$GRADLE_HOME/bin

# create ec2-user
RUN groupadd -g 500 ec2-user && useradd -u 500 -g ec2-user ec2-user
USER ec2-user

VOLUME /workspace
WORKDIR /workspace

ENTRYPOINT ["gradle"]
