#!/bin/sh
cd "$(dirname "$(readlink -fn "$0")")"
java -Xms1G -Xmx2G -jar forge-1.12.2-XYZ-universal.jar