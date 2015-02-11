#!/bin/bash

CONSUMER_KEY=""
CONSUMER_SECRET=""
ACCESS_TOKEN=""
ACCESS_SECRET=""
URL="" #URL to make screenshot of

TWITTERURL="https://api.twitter.com/1.1/account/update_profile_banner.json"
TMPFILE="tmp_image.jpg"
OUTFILE="image.jpg"
WIDTH=1500
HEIGHT=500

/usr/bin/xvfb-run -a -s "-screen 0 640x480x24"  cutycapt --url=$URL --out=$TMPFILE --min-width=$WIDTH
/usr/bin/convert $TMPFILE +repage -crop ${WIDTH}x${HEIGHT}+0+0 -gaussian-blur 0x6 $OUTFILE 

IMGDATA=$(base64 -w0 ${OUTFILE})
DATA="banner=${IMGDATA}%26height=${HEIGHT}%26offset_left=0%26offset_top=0%26width=${WIDTH}"
TOKEN=$(oauth_sign $CONSUMER_KEY $CONSUMER_SECRET $ACCESS_TOKEN $ACCESS_SECRET POST ${TWITTERURL} "${DATA}")

/usr/bin/curl -L "${TWITTERURL}" -H "Authorization:${TOKEN}" --data-urlencode "${DATA}" --verbose

rm $TMPFILE
rm $OUTFILE

