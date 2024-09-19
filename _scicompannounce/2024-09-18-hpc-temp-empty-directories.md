---
Title: Empty Directories in Temp
---

There is an issue with the Temp file system- empty directories are being removed nightly.  This is a consequence of the way the Temp service was designed and the aging policies we have applied.

The only workaround is to make empty directories... not empty.  We recommend using a hidden file (a file that starts with a dot. like `.placeholder`) in a directory to keep it from being removed.

We have reported this to the vendor and they are working on a permananent fix.

