![](https://s31.postimg.org/ea4bt36u3/rsz_screenshot_from_2016_07_06_14_55_41.png)
> Providing support for police with automation of claim receiving process ([view presentation on Slide Share](http://www.slideshare.net/RomanKaporin/police-assistance-system-ukrainian-localization) or [download it](https://drive.google.com/file/d/0B8433SXZV3xVODFfMjRUM2NfaHc/view?usp=sharing)).

![Main window](https://s32.postimg.org/gs0svhwj9/rsz_screenshot_from_2016_07_06_14_24_11.png)
# Support server specifications
> It's designed to decrease load on main server.
## How does it work
  1.  System receives geolocation of each crew that registered on support server
  2.  Support server periodically updates information on main server such as geo location and crew status

## Inside the system
System consists of two servers: _Main_ and _Support_. This document is about __Support__ server.
![](https://s32.postimg.org/3uzmheg1h/Snapseed.jpg)
Tasks of __Support__ server:
 - receiving data from police crews
 - synchronizing data on main server with the latest information about crews
