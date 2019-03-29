#!/bin/sh

lower=/cfg/preserve/${1}
upper=/cfg/overlay/${1}
work=/cfg/overlay/${1}_work
target=${2}

mkdir -p "$work" "$upper"
mount -t overlay overlay \
      -olowerdir=${lower},upperdir=${upper},workdir=${work} \
      "$target"
