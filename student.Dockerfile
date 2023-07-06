FROM ghcr.io/haspamelodica/charon:base

# Charon/student is already built by base.Dockerfile.

RUN mvn org.apache.maven.plugins:maven-dependency-plugin:3.3.0:get -Dartifact=org.codehaus.mojo:exec-maven-plugin:3.0.0

# This is where the student files and run script will be copied to
WORKDIR /data
CMD ./run_in_docker.sh
