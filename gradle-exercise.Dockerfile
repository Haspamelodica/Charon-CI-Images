FROM gradle:jdk19

RUN useradd -m dockeruser
USER dockeruser
WORKDIR /home/dockeruser

COPY --chown=dockeruser build_with_gradle.sh build_with_gradle.sh

COPY --chown=dockeruser Charon Charon
COPY --chown=dockeruser streammultiplexer streammultiplexer
RUN ./build_with_gradle.sh streammultiplexer
RUN ./build_with_gradle.sh Charon/common
RUN ./build_with_gradle.sh Charon/exercise/base
RUN ./build_with_gradle.sh Charon/exercise/frontend/ssi
RUN ./build_with_gradle.sh Charon/exercise/junitextension
RUN ./build_with_gradle.sh Charon/exercise/frontend/mockclasses

# This is where the exercise will be mounted to and the run script will be placed
WORKDIR /data
CMD ./run_in_docker_gradle.sh
