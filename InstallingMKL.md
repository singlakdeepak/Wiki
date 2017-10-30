# Installing Intel MKL

It is difficult to find an Intel Standalone package for Intel-MKL since these days, it come as a part of Intel Parallel Studio XE. I obtained a Student license for working with the product and downloaded the online installer for Parallel Studio. Now, the main part is to follow the instructions carefully given [here]( https://software.intel.com/sites/default/files/managed/17/53/parallel-studio-xe-2018-install-guide-linux.pdf). Otherwise, you will end up doing something else. There's an option of custom installation while running the installer file and you can just select Intel MKL for your purpose. 

All right, you are set installing Intel-MKL. Now the need is to set up the environment. You can put up the following in your .bashrc. For details you can check [here](https://software.intel.com/en-us/articles/intel-mkl-111-getting-started#Environment).
```
source /opt/intel/mkl/bin/mklvars.sh ia32
```

An example C script for testing is given [here](https://software.intel.com/en-us/mkl-tutorial-c-multiplying-matrices-using-dgemm#9CEED00C-1A85-4AC0-8AF8-BE2AFEF0E603). Run it as:
```
gcc -m32 <Code.c> -lmkl_intel -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm
```

By the way, you can encounter a problem in between such as `fatal error: sys/cdefs.h: No such file or directory`. You can solve it by it going through this [Stack Overflow question](https://askubuntu.com/questions/470796/fatal-error-sys-cdefs-h-no-such-file-or-directory).

ENJOY!
