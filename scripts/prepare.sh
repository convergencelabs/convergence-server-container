#!/usr/bin/env sh

CONVERGENCE_VERSION=1.0.0-SNAPSHOT

# Prepare Directories
mkdir -p build

# Copy the source files
cp -a src/* build

# Download the Convergence Server Universal Distribution
CONVERGENCE_URL=https://nexus.dev.convergencelabs.tech/repository/maven-all/com/convergencelabs/convergence-server/$CONVERGENCE_VERSION/convergence-server-$CONVERGENCE_VERSION.tgz
echo "Downloading Convergence Server $CONVERGENCE_VERSION from: $CONVERGENCE_URL"
curl --insecure $CONVERGENCE_URL --output build/convergence-server.tgz
