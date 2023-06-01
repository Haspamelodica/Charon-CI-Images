#!/bin/bash

set -e

cd "$1"
gradle init </dev/null
gradle publishToMavenLocal
