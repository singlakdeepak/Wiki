# OpenCV Installation on Mac 

It is really a difficult task to install OpenCV and set it up. Before installing, ensure that you have the following things pre-installed in your Mac. 
* XCode
* HomeBrew
* **wget** tool

You might need to install some other dependencies before proceeding.
A good tutorial for downloading it is given in [this link](https://stackoverflow.com/questions/34340578/installing-c-libraries-on-os-x).

Follow all the steps and also set the flags in `.bash_profile` as follows:

```
export PATH="/usr/local/opt/opencv3/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/opencv3/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"

export LDFLAGS="/usr/local/opt/opencv3/lib:$LDFLAGS"
export LDFLAGS="/usr/local/opt/openssl@1.1/include:$LDFLAGS"
export CPPFLAGS="/usr/local/opt/opencv3/include:$CPPFLAGS"
export CPPFLAGS="/usr/local/opt/openssl@1.1/include:$CPPFLAGS"
```

Now, you might encounter some error like this if you test it on a .cpp script. 
```
dyld: Library not loaded: /usr/local/lib/libjpeg.8.dylib
  Referenced from: /usr/local/bin/XXXX
  Reason: image not found
Trace/BPT trap: 5
```

Then please run the following to get the things all set.
```
wget -c http://www.ijg.org/files/jpegsrc.v8d.tar.gz
tar xzf jpegsrc.v8d.tar.gz
cd jpeg-8d
./configure
make
cp ./.libs/libjpeg.8.dylib /usr/local/opt/jpeg/lib
```

Reference: https://stackoverflow.com/questions/32703296/dyld-library-not-loaded-usr-local-lib-libjpeg-8-dylib-homebrew-php

Now you are ready to go. Enjoy working on OpenCV for C++.
