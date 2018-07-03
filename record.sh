#!/bin/bash
STREAM="rtmp://ebsandroid.ebs.co.kr:1935/fmradiofamilypc/familypc1m"
# replace space to dash
PROGRAM=$1
PROGRAM_DASH=${PROGRAM// /-}

RECORD_MINS=$(($2 * 60))

# make directory
REC_MONTH=`date +%y%m`
RECORDING_ROOT=/recording/$PROGRAM/$REC_MONTH
mkdir -p "$RECORDING_ROOT"

# make record file name
REC_DATE=`date +%Y%m%d`
MP3_FILE_NAME=$REC_DATE"_"$PROGRAM_DASH.mp3

# recording
TEMP_FLV=`mktemp -u`
echo $TEMP_FLV
rtmpdump -r $STREAM -B $RECORD_MINS -o $TEMP_FLV -q
ffmpeg -i $TEMP_FLV -ac 2 -ab 128 -af "volume=10dB" -vn -y -f mp3 "$RECORDING_ROOT/$MP3_FILE_NAME"
rm $TEMP_FLV