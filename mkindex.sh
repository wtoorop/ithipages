#!/bin/sh

cat >index.html << HEAD
<html>
<head><title>Example ITHI Pages</title></head>
<body>
  <ul>
HEAD
for srcdir in `find coverage -type d -name src`
do
	reportdir=${srcdir%/src}
	branch=${reportdir#coverage/}
    	echo "    <li><a href=\"${reportdir}/\">Code coverage on branch ${branch}</a></li>" >> index.html
done
if [ -d analysis ]
then
	for r in analysis/*
	do
		name=${r%-*-*}
    		echo "    <li><a href=\"$r\">Static analysis from ${name#analysis/}</a></li>" >> index.html
	done
fi
cat >>index.html << TAIL
    <li><a href="doxygen">Doxygen Documentation</a></li>
  </ul>
</body>
</html>
TAIL
