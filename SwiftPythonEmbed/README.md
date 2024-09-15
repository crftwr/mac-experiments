#  Swift + Python embedding test

## Steps

1. Enable C++ interoperability in the build setting
1. Download & install Python from official website.
    - https://www.python.org/downloads/
1. Add Header Search Path in Build Settings
    - /Library/Frameworks/Python.framework/Versions/3.12/include/python3.12
1. Add Library Search Path in Build Settings
    - /Library/Frameworks/Python.framework/Versions/3.12/lib (needed?)
1. Add `libpython*.dynlib` in Build Phases
    - /Library/Frameworks/Python.framework/Versions/3.12/lib/libpython3.12.dylib
1. Check "Disable Library Validation" in "Signing & Capabilities"
1. Create a symbolic link of Python.framework (needed?)
    ```
    cd ~/Library/Developer/Xcode/DerivedData/mac-experiments-gjzfjecegbhiwyciqrhfsklmetnj/Build/Products/Debug
    ln -s /Library/Frameworks/Python.framework ./
    ```
