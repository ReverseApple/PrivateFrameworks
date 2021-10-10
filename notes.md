# Notes

1. Determine the PrivateFramework to interact with to achieve the end goal.

2. get the runtime headers for the framework you chose from github and place them in the "include" folder in the project directory.


### including the headers in cmake...

- Add the folders `<NAME>.framework/headers` in the project include directory.
- drag+drop all of the headers from github into the `<NAME>.framework/headers` folder.
- In `CMakeLists.txt`, add `./include/<NAME>.framework` to `target_include_directories`.

### targeting the private framework...

Your `target_link_libraries` call in `CMakeLists.txt` should look something like this...

```cmake
target_link_libraries(APFIExperiment
        "-framework Foundation"
        "-iframework /System/Library/PrivateFrameworks -framework CoreBrightness"
        )
```

Where `CoreBrightness` gets replaced with the name of the name of the framework you chose.

The `-iframework` flag simply gives CMake context as to where the private framework is located.

### clang troubleshooting
* If clang has a problem with `#import "NSObject.h"`, just comment it out and you'll be fine.
* Replacing all the unknown types/structs with the type `id` seems to satisfy the compiler.
I don't exactly know what to do in the circumstance where they are required to achieve the task at hand though–because they usually aren't defined anywhere in the header dump.