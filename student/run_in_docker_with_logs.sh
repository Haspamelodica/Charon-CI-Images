#!/bin/bash

# TODO only debugging
echo Some standard output
echo Some error output >&2
exec mvn compile exec:java
