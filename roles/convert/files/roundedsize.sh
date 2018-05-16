#! /bin/bash
MB=$((1024*1024))
size=$(qemu-img info -f raw --output json "$1" | \
       gawk 'match($0, /"virtual-size": ([0-9]+),/, val) {print val[1]}')
if [ $(($size % $MB)) = 0 ]
then
	ROUNDED_SIZE=0
	export ROUNDED_SIZE
else
	ROUNDED_SIZE=$($size + $($size % $MB))
  export ROUNDED_SIZE
fi
