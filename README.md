# Handbrake on Synology Nas

This project is the companion code to [this](http://ivo2u.nl/dA) blog post.

It contains the code necessary to get Handbrake CLI working on your Synology NAS.

## usage

* Copy scripts in the bin folder to your synology ~/bin folder
* make sure the ~/bin folder is part of your PATH
* make sure the files are executable `chmod +x ~/bin/m4v*`
* Change the `CONVERTED_FILE_LOCATION` in `m4v.sh` to point to a location on your NAS
* Change directory to you have a `*.mkv` file to convert
* `m4v.sh "<your movie>.mkv"` wait and see it arrive in `CONVERTED_FILE_LOCATION`

Note that the first time will take longer because Docker needs to download the image
of course convertion will always take quite a bit of time so you might want to start
conversions from a `screen` (read about in on the internet) to be able to log off.

Have fun,

Ivo.