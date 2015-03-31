#!/bin/bash
# build all targets for PX4
# This helps when doing large merges
# Andrew Tridgell, February 2013

. config.mk

set -e
set -x

for d in ArduPlane ArduCopter APMrover2 APMbalancer; do
    pushd $d
    make px4-clean
    popd
done

echo "Testing ArduPlane build"
pushd ArduPlane
make px4
popd

echo "Testing ArduCopter build"
pushd ArduCopter
make px4
popd

echo "Testing APMrover2 build"
pushd APMrover2
make px4
popd

echo "Testing APMbalancer build"
pushd APMbalancer
make px4
popd

exit 0
