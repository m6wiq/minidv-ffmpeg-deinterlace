#=== Notes regarding the DV Files:===
#
#size="720x576" 
#video_rate="25" 
#chroma_subsampling="4:2:0" == yuv420p
#aspect_ratio="4/3" 
#audio_rate="32000" 
#channels="4"

#Declarations

#BWDIF
filterVModeBWDIF_720p="fieldorder=bff,bwdif=mode=1, scale=w=960:h=720:flags=lanczos"

mkdir output

for f in *.dv
do
  DATE=$(mediainfo --Output="General;%Recorded_Date%" "$f" | cut -c1-19)
  SAFE_DATE=$(echo "$DATE" | sed -e 's/://g' -e 's/ /_/g')
  OUTPUT="output/${f%.*}.mp4"

  echo "Converting $f..."
    
  ffmpeg -i "$f" -threads 8 -r 50 -c:v h264_nvenc -rc vbr_hq -filter:v "$filterVModeBWDIF_720p" \
    -c:v hevc -tag:v hvc1 -crf 17 -pix_fmt yuv420p -movflags +faststart \
    -c:a aac -b:a 256k -metadata creation_time="$DATE" -hide_banner "$OUTPUT"

done
