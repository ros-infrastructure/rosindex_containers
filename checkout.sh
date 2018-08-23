#!/bin/bash

mkdir -p workdir

vcs import --input rosindex/resources.repos workdir

mkdir -p checkout
