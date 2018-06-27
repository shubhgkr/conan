#!/bin/bash
value=`cat /home/user/Desktop/count.txt`
count=${value##*$'\n'}
count=$(($count+1))
echo $count
url="https://www.animepace.si/anime/detective-conan/episode-$count"
echo "getting:$url"
result="`wget -qO- $url`"

#echo $result|grep -Po "source src=\"http.*?video\.mp4"|head -n 1 |grep -o "h.*"
url=`echo $result|grep -Po "source src=\"http.*?video\.mp4" | head -n 1 | sed 's/source src="//'`
echo $url
#youtube-dl $url --ignore-config -o ~/%(title)s.%(ext)s --no-check-certificate
echo -e $count>>"count.txt"
echo "done"
