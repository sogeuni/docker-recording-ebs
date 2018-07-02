#!/bin/bash
STREAM="rtmp://ebsandroid.ebs.co.kr:1935/fmradiofamilypc/familypc1m"
# replace space to dash
PROGRAM=${1// /-}
RECORD_MINS=$(($2 * 60))

# make directory
RECORD_ROOT=/record/$PROGRAM
mkdir -p $RECORD_ROOT

# make record file name
REC_DATE=`date +%Y%m%d`
MP3_FILE_NAME=$REC_DATE"_"$PROGRAM.mp3

# recording
TEMP_FLV=`mktemp -u`
echo $TEMP_FLV
rtmpdump -r $STREAM -B $RECORD_MINS -o $TEMP_FLV
ffmpeg -i $TEMP_FLV -ac 2 -ab 128 -vn -y -f mp3 $RECORD_ROOT/$MP3_FILE_NAME
rm $TEMP_FLV