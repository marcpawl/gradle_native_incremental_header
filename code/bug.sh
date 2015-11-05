#!/bin/bash
export PATH=/gradle-2.8/bin/:$PATH
cd /code
gradle build
rc1=$?
echo gradle return code $rc1
if [  $rc1 != 0 ] 
then
  echo gradle build failed when it should have passed: $rc1
  echo "TEST CASE PROBLEM???"
  exit 1
fi

echo "Modifying src/local.h to break the build"
echo "bad stuff added to header" >> src/local.h

gradle build
rc2=$?
echo gradle return code $rc2
if [ $rc2 == 0 ] 
then
  echo gradle build passed when it should have failed: $rc2
  echo "Now I will make the build fail by calling clean"
  gradle clean build
  rc3=$?
  echo gradle return code $rc3
  if [  $rc3 != 0 ] 
  then 
    echo "build failed as expected."
    echo "TEST FAILED"
    exit 1
  else
    echo "build is still passing, test case problem???"
    exit 1
  fi
fi

echo "TEST PASSED"
exit 0
