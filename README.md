# gradle_native_incremental_header
Demo of gradle not recompiling when a header file changes.

Using docker to build image
<pre>
$ docker build -t gradle_native_incremental_header .
$ docker run  gradle_native_incremental_header /code/bug.sh
</pre>
You may just want to touch up bug.sh and run it if you have gradle already installed.

See https://discuss.gradle.org/t/native-not-recompiling-when-header-changes-gradle-2-8/12627

A build is first made that uses a .cpp file that includes a header file.  The header file is then modified to no longer be valid, rebuilding succeeds since the .cpp file is not recompiled.  Performing 'gradle clean build', forces the recompile and the build will now fail.

Not quite what is expected for an incremental build system for C++

The expectation is that gradle would use something like the 'gcc -M' option to find the header files to are used when determining if a rebuild is necessary.

If we change the 'build.gradle' to have
<pre>
                    source {
                        srcDirs "src"
                        include "*.cpp"
                        include "*.h"
                    }
</pre>
the test case will pass, but a file local.o is generated, so not a desired outcome.
