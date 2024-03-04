#!/bin/bash

CPU=$1; shift
OS=$1; shift
LCL=$1; shift

pushd lazarus/ || exit 1

make clean lazbuild registration lcl basecomponents bigidecomponents \
  CPU_TARGET=$CPU \
  OS_TARGET=$OS \
  LCL_PLATFORM=$LCL \
  OPT="-n @/etc/fpc.cfg -Xs -CX -O2 -XX -Sc"

RESULT=$?

popd || exit 1

exit $RESULT
