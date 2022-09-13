# Scripts

## [1.awk](https://github.com/facundolaffont/awk-scripts/blob/main/1.awk)
Prints everything except what is matched against the regular expression stored in a variable called `regex`.

## [2.awk](https://github.com/facundolaffont/awk-scripts/blob/main/2.awk)
Prints the sum of files sizes in a folder.

To make it work, copy this file into the desired folder, and type in console:
```sh
clear && ls -lh | awk -f sumFilesSize.awk
```
