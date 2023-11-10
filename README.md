# vimdeo
A simple video reader plugin for vim. It is essentially useless but why not ?
Formats supported at the moment:
* image_extensions = [".jpg", ".jpeg", ".png", ".tif", ".tiff", ".bmp", ".gif", ".pbm", ".pgm", ".ppm", ".hdr", ".exr"]
* video_extensions = [".avi", ".mp4", ".mkv", ".mov", ".flv", ".mpeg", ".mpg", ".wmv"]

Fun fact: you can zoom so much in video mode that you can see the pixels values!!
Fun fact 2: you can't use vim while playing a video or visualizing an image!! 

# Installation
If you are using Bundle, insert the following line in your .vimrc:
> Plugin 'florestan-fl/vimdeo'

# Commands
* `:PlayVimdeo <path>`

In video mode, press 'q' or click on the cross to quit. Press ' ' to pause and resume.
In image mode, do not press the cross (known bug), press 'q' instead.

# Requirements
You can find the requirements in `autoload/vimdeo.vim`
