FROM ghcr.io/haspamelodica/charon:base

# Charon/student is already built by base.Dockerfile.

RUN mvn org.apache.maven.plugins:maven-dependency-plugin:3.3.0:get -Dartifact=org.codehaus.mojo:exec-maven-plugin:3.0.0

# The run script and student submission will be placed at the current working directory, which is /home/dockeruser.
CMD ./run_in_docker.sh
