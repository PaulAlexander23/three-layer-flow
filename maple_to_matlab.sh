#!/bin/bash

clear
read filename
cp $filename backup_$filename
sed -i 's/*/.*/g' $filename
sed -i 's/\//.\//g' $filename
sed -i 's/\^/.\^/g' $filename
sed -i 's/(t, x)//g' $filename
sed -i 's/diff(diff(diff(diff(y1, x), x), x), x)/(D4*y1)/g' $filename
sed -i 's/diff(diff(diff(diff(y2, x), x), x), x)/(D4*y2)/g' $filename
sed -i 's/diff(diff(diff(y1, x), x), x)/(D3*y1)/g' $filename
sed -i 's/diff(diff(diff(y2, x), x), x)/(D3*y2)/g' $filename
sed -i 's/diff(diff(y1, x), x)/(D2*y1)/g' $filename
sed -i 's/diff(diff(y2, x), x)/(D2*y2)/g' $filename
sed -i 's/diff(y1, x)/(D1*y1)/g' $filename
sed -i 's/diff(y2, x)/(D1*y2)/g' $filename
echo "Complete."
