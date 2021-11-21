# minidv-ffmpeg-deinterlace
Hacky Bash Script for batch converting MiniDV Videos into a more modern and deinterlaced file format.

Still very much a work in progress at this point. 

Inspired by this blog post https://leolabs.org/blog/capture-minidv-on-macos/

1) To capture from the camcorder:

dvgrab --autosplit --timestamp --size 0 --rewind Video-

Autosplit: Splits into clips as they were recorded. The advantage of this is that clips can be processed on their own or as a batch.
Size 0: No limit on size of the files (typically defaults to 1gb files).
Rewind: automatically rewinds the tape at the end of capture.
