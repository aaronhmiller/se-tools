#!/bin/sh
i=0
while [ $i -lt 100 ]
do 
  echo $i
  http :8000/anything\?SSN=123-45-6789 hack:true
  i=`expr $i + 1`
done
