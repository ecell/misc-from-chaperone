#!/bin/sh
TARGET_JAVAC=`env LANG=C update-alternatives --display javac | sed -e "s/Current \\\`best' version is \\(.*\\)\.\$/\\1/; t e; d; :e"`
echo JAVA_HOME=/usr/lib/jvm/`find /usr/lib/jvm -maxdepth 1 -iname "*.jinfo" | head -n 1 | while read file; do test \`sed -e 's/^jdk  *javac  *//; t e; d; :e' $file\` = "$TARGET_JAVAC" && sed -e 's/name= *//; t e; d; :e' $file; done`
