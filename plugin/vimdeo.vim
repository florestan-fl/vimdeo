function! vimdeo#Play(path)
    python3 << EOF

import vim
import os
import signal

pid_file_path = "/tmp/vimdeo_pid.txt"
try:
    path = vim.eval("a:path")
    if not path.startswith(os.sep):
        path = "."+os.sep+path
        path = os.path.abspath(path)
    image_extensions = [".jpg", ".jpeg", ".png", ".tif", ".tiff", ".bmp", ".gif", ".pbm", ".pgm", ".ppm", ".hdr", ".exr"]
    video_extensions = [".avi", ".mp4", ".mkv", ".mov", ".flv", ".mpeg", ".mpg", ".wmv"]

    image, video = True, True
    if not any(path.lower().endswith(ext) for ext in image_extensions):
        image = False
    if not any(path.lower().endswith(ext) for ext in video_extensions):
        video = False
    if (not image) and (not video):
        raise ValueError("File format not handled. Extensions handled : video : " + str(video_extensions) + ", images : " + str(image_extensions))
except Exception as e:
    print(e)

import cv2 
  
if video:
    # Create a VideoCapture object and read from input file 
    cap = cv2.VideoCapture(path) 
      
    # Check if camera opened successfully 
    if (cap.isOpened()== False): 
        print("Error opening video file") 
  
    quitting=False
    # Read until video is completed 
    while(cap.isOpened() and not quitting): 
          
    # Capture frame-by-frame 
        ret, frame = cap.read() 
        if ret == True: 
        # Display the resulting frame 
            cv2.imshow('Frame', frame) 
              
        # Press Q on keyboard to exit 
            if cv2.waitKey(25) & 0xFF == ord('q'): 
                break
            elif cv2.waitKey(25) & 0xFF == ord(' '): 
                # Wait until Space is released to avoid multiple keypresses
                while cv2.waitKey(25) & 0xFF != ord(' '):
                    if cv2.waitKey(25) & 0xFF == ord('q'): 
                        quitting=True
                        break
                    elif cv2.getWindowProperty('Frame', cv2.WND_PROP_VISIBLE) < 1:
                        quittin=True
                        break
                    pass
            elif cv2.getWindowProperty('Frame', cv2.WND_PROP_VISIBLE) < 1:
                break
      
    # Break the loop 
        else: 
            break
      
    # When everything done, release 
    # the video capture object 
    cap.release() 
      
    # Closes all the frames 
    cv2.destroyAllWindows() 
elif image:
    import cv2

    # Read an image file
    image = cv2.imread(path)

    # Your image processing code here
    cv2.imshow('Image', image)
    while True:
        if cv2.waitKey(0) & 0xFF == ord('q'):
            break
    cv2.destroyAllWindows()

EOF
endfunction

command! -complete=file -nargs=1 PlayVimdeo :call vimdeo#Play(<q-args>)

