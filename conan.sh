#!/bin/bash
value=`cat ~/conan/count.txt`
count=${value##*$'\n'}
count=$(($count+1))
echo $count
url="https://www.animepace.si/anime/detective-conan/episode-$count"
echo "getting:$url"
result="`wget -qO- $url`"

#echo $result|grep -Po "source src=\"http.*?video\.mp4"|head -n 1 |grep -o "h.*"
url=`echo $result|grep -Po "source src=\"http.*?video\.mp4" | head -n 1 | sed 's/source src="//'`
echo $url
output='/home/shubhgkr/Videos/ep'$count'.%(ext)s'
youtube-dl $url --ignore-config --console-title -o $output --no-check-certificate
echo $count>>"count.txt"
