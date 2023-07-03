FROM maven:3-eclipse-temurin-19

RUN useradd -m dockeruser
USER dockeruser
WORKDIR /home/dockeruser

# Set MAVEN_CONFIG. Otherwise, some entrypoint script prints some error.
# We also have to manually create that directory.
RUN mkdir -p .m2
ENV MAVEN_CONFIG=/home/dockeruser/.m2

COPY --chown=dockeruser Charon Charon
COPY --chown=dockeruser exchanges exchanges
RUN cd exchanges && mvn install
RUN cd Charon/common && mvn install
# The junitextension can run in samejvm mode, so the exercise side needs Charon/student as well.
# In practice, though, the code will never be executed.
RUN cd Charon/student && mvn install
