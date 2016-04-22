#Ammend the xml file with a path to the newly added photo
sed -i 's~<!-- add photo here -->~\
<!-- add photo here -->\
<scene name="'"$file"'" title="'"$file"'" onstart="" lat="'"$lat"'" lng="'"$lon"'" heading="0.0">\
<view hlookat="-1" vlookat="11" fovtype="MFOV" fov="120" maxpixelzoom="2.0" fovmin="70" fovmax="140" limitview="auto"/>\
<image>\
	<sphere url="'photos/"$file"'"/>\
</image>~' ../web/client/tour.xml

#Take photo with ffmpeg
/home/root/bin/ffmpeg/ffmpeg -s 1280x720 -f video4linux2 -input_format mjpeg -i /dev/video0 -s 1280x720 -f video4linux2 -input_format mjpeg -i /dev/video1 -filter_complex "nullsrc=size=2560x720 [base]; [0:v] setpts=PTS-STARTPTS, scale=1280x720 [left]; [1:v] setpts=PTS-STARTPTS, scale=1280x720 [right]; [base][left] overlay=shortest=1 [tmp1]; [tmp1][right] overlay=shortest=1:x=1280" -f image2 -vframes 1 /home/root/edi-cam/web/client/photos/"$file"