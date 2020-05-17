#!/usr/bin/env sh

set -e

# Configs
SNAPSHPOT_REPO_URL=https://oss.sonatype.org/content/repositories/snapshots
RELEASE_REPO_URL=https://repo1.maven.org/maven2
REALTIVE_URL=com/convergencelabs/convergence-server-universal/$CONVERGENCE_SERVER_VERSION/convergence-server-universal-$CONVERGENCE_SERVER_VERSION.tgz

case "$CONVERGENCE_SERVER_VERSION" in
    *SNAPSHOT* ) REPO_BASE_URL=$SNAPSHPOT_REPO_URL;;
    * ) REPO_BASE_URL=$RELEASE_REPO_URL;;
esac

DOWNLOAD_URL=$REPO_BASE_URL/$REALTIVE_URL
echo "Downloading the Convergence Server Universal Distribution $CONVERGENCE_SERVER_VERSION from: $DOWNLOAD_URL"
curl $DOWNLOAD_URL --output /tmp/convergence-server.tgz

case "$CONVERGENCE_SERVER_VERSION" in
    *SNAPSHOT* )
      echo "Skipping download verification for SNAPSHOT versions"
      ;;
    * )
      echo "Verifying Convergence Server Universal Distribution download"
      echo "$CONVERGENCE_SERVER_MD5 */tmp/convergence-server.tgz" | md5sum -c -
      echo "$CONVERGENCE_SERVER_SHA1 */tmp/convergence-server.tgz" | sha1sum -c -
      ;;
esac

