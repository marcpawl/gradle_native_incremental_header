# gradle_native_incremental_header
Demo of gradle not recompiling when a header file changes.

Using docker to build image:
$ docker build -t gradle_native_incremental_header .
$ docker run  gradle_native_incremental_header /code/bug.sh

You may just want to touch up bug.sh and run it if you have gradle already installed.

See https://discuss.gradle.org/t/native-not-recompiling-when-header-changes-gradle-2-8/12627
