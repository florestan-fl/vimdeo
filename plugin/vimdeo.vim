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
except Exception as e:
    print(e)

import cv2 
import numpy as np 
  
# Create a VideoCapture object and read from input file 
cap = cv2.VideoCapture(path) 
  
# Check if camera opened successfully 
if (cap.isOpened()== False): 
    print("Error opening video file") 
  
# Read until video is completed 
while(cap.isOpened()): 
      
# Capture frame-by-frame 
    ret, frame = cap.read() 
    if ret == True: 
    # Display the resulting frame 
        cv2.imshow('Frame', frame) 
          
    # Press Q on keyboard to exit 
        if cv2.waitKey(25) & 0xFF == ord('q'): 
            break
  
# Break the loop 
    else: 
        break
  
# When everything done, release 
# the video capture object 
cap.release() 
  
# Closes all the frames 
cv2.destroyAllWindows() 

EOF
endfunction

command! -complete=file -nargs=1 PlayVimdeo :call vimdeo#Play(<q-args>)
