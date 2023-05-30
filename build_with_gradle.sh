#!/bin/bash

set -e

cd "$1"
gradle init </dev/null
# For some reason, Gradle isn't able to determine the source compability correctly. This is an ugly workaround for that.
sed -i 's/java.sourceCompatibility = JavaVersion.*/java.sourceCompatibility = JavaVersion.VERSION_19/' build.gradle
gradle publishToMavenLocal
