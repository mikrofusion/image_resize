PhoneGap requires the same image be converted to a number of sizes with a specific filename.  Goal of image_resize is to automate the image resize process. 

Note:  this is ios specific at this point.

Once created icons / splash files go into <project>/platforms/ios/<project/<resources>/(splash or icons)

usage
-----
This uses sips to do the image resize (so might require tweaking on a non-mac os).

create icon images
--------------------
resize images to icon sizes

```
ruby image_resize.rb -i <filename>
```

output will be a ```icons``` directory with all the newly created files.

create splash images
--------------------
crop images to splash image sizes

```
ruby image_resize.rb -s <filename>
```

output will be a ```splash``` directory with all the newly created files.