#!/bin/bash

docker build . \
    -f Dockerfile \
    -t ml_env:latest
