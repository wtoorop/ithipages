#!/bin/sh

cat >index.html << HEAD
<html>
<head><title>Example ITHI Pages</title></head>
<body>
  <ul>
    <li><a href="coverage">Results from coverage testing</a></li>
    <li><a href="doxygen">Doxygen Documentation</a></li>
HEAD
if [ -d analysis ]
then
	for r in analysis/*
	do
		name=${r%-*-*}
    		echo "    <li><a href=\"$r\">Static analysis from ${name#analysis/}</a></li>" >>index.html
	done
fi
cat >>index.html << TAIL
  </ul>
</body>
</html>
TAIL
