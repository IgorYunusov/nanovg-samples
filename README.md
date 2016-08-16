# nanovg samples

* https://github.com/memononen/NanoVG

# build MSYS + MinGW64

```
$ cd projects
$ ./premake5.exe gmake
$ cd build_gmake
$ make

or 

$ make config=debug_win64
$ make config=release_win64
$ make config=debug_win32
$ make config=release_win32
```

# build vs2015

* execute projects/premake5_vs2015.bat
* open projects/build_vs2015/nanovg-samples.sln

