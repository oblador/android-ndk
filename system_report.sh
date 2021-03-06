#!/bin/bash
set -e

echo
echo '#'
echo '# This System Report was generated by: https://github.com/bitrise-docker/android-ndk/blob/master/system_report.sh'
echo '#  Pull Requests are welcome!'
echo '#'
echo

echo
echo "=== Revision / ID ======================"
if [ -z "$BITRISE_DOCKER_REV_NUMBER_ANDROID_NDK" ] ; then
  echo " [!] No BITRISE_DOCKER_REV_NUMBER_ANDROID_NDK defined!"
  exit 1
fi
echo "* BITRISE_DOCKER_REV_NUMBER_ANDROID_NDK: $BITRISE_DOCKER_REV_NUMBER_ANDROID_NDK"
echo "========================================"
echo
if [ -f "${ANDROID_NDK_HOME}/source.properties" ] ; then
  echo "$ cat ${ANDROID_NDK_HOME}/source.properties"
  cat "${ANDROID_NDK_HOME}/source.properties"
elif [ -f "${ANDROID_NDK_HOME}/RELEASE.TXT" ] ; then
  echo "$ cat ${ANDROID_NDK_HOME}/RELEASE.TXT"
  cat "${ANDROID_NDK_HOME}/RELEASE.TXT"
else
  echo "No NDK version file found!"
  exit 1
fi
echo
echo "$ tree -L 2 /opt/android-ndk"
tree -L 2 /opt/android-ndk
echo

echo
echo "=== Pre-installed tool versions ========"
ver_line="$(cmake --version | head -n 1)" ;         echo "* cmake: $ver_line"
echo "========================================"
echo
