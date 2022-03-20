These scripts are pretty simple and straight forward.

Prereqs
- platforms tool downloaded
- apks to be sideloaded downloaded
- vpn configs created

Its important to view the header of the scripts to know where to place your files in the folder structure.
`cat atak_install.sh`
`cat 6x_bloat.sh`

Use those lines in the terminal within the folder.

Its also important that the environment is set to use the script with plateform-tools. Use this clip from another tut to help you.

### Obtaining fastboot

You need an updated copy of the fastboot tool and it needs to be included in your **"PROGRAM PATH"** environment variable.

You can download the official releases of platform-tools](https://developer.android.com/studio/releases/platform-tools) from Google. You can either obtain these as part of the standalone SDK or Android Studio. For one time usage, it's easiest to obtain the latest standalone platform-tools release, extract it and add it to your **"PROGRAM PATH"** in the current shell. For example:

```
unzip platform-tools_r30.0.4-linux.zip
export PATH="PATH TO/platform-tools:$PATH"
```
Example: 
`export PATH="/Users/username/platform-tools:$PATH"`

Sample output from
`fastboot --version`
afterwards:
```
fastboot version 30.0.4-6686687
Installed as /home/username/platform-tools/fastboot
```
Don't proceed with the installation process until this is set up properly in your current shell. Also, make sure the version matches the above or is newer/higher than this, as older versions are unsuitable for flashing.

Enjoy and good luck!
