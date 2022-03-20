script usage notes

stegin - Download to the desktop and place in the same folder as the other files.
	   - Double click on the file and click run in terminal. (If it will not run right click on the desktop open a terminal then type chmod +x stegin then try again) 
	   - The script will ask for inputs, after it is finished you'll have your stegged file.

stegout - Same before make sure the stegged file is in the same folder as the script

vcsteg2-1.py - To steg the file, ensure the script is in the same folder as video and veracrypt container. Right click in the folder or Desktop then open a terminal. Type     python vcsteg2-1.py somevid.mp4. SEE http://keyj.emphy.de/real-steganography-with-truecrypt from more info.


To generate a steganographic TrueCrypt/QuickTime hybrid using the script, do the following:

    Find a good candidate QuickTime or MP4 file to use as a disguise, let’s say SomeVideo.mp4. The file should be encoded in a very efficient way so that an increase in filesize is believable in relation to the length and quality of the video. Estimate how much larger the file may become without becoming suspicious.
    Use TrueCrypt’s Volume Creating Wizard to create a new hidden(!) TrueCrypt volume.
        Use the name of the final hybrid file as the container file name, e.g. InnocentLookingVideo.mp4.
        As the outer volume size, enter the estimated maximum enlargment from step 1.
        Don’t bother entering a good password for the outer volume, it will be destroyed anyway.
        Use the maximum possible size for the hidden volume. Enter the size in KB instead of MB and do a bit of number guessing – the »Next« button in the wizard is disabled when the size is too large. Find the maximum size where the button is still clickable. (Technically, you could enter lower values, but why should you? Every byte left to the outer volume is a wasted byte!)
        Use your real ultra-secret password or keyfile for the hidden volume.
        Do not mount the outer volume! You will likely destroy the hidden volume otherwise.
    Use the script:

        python tcsteg.py SomeVideo.mp4 InnocentLookingVideo.mp4

    This will modify the TrueCrypt container file in-place. It might still take a while to process, since the disguise file is basically copied over into the container file.
    If everything worked, you will now have a file that
        looks like a video file in every way
        can be played as a video file using normal video player applications
        can still be mounted in TrueCrypt as a hidden volume
        is very hard to detect as a hybrid file

    Sounds neat, eh? ;)

