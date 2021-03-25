# Image Processing Helper Functions  


### ac_Highboost.m  
Used to sharpen the image using the unsharp masking technique (highboosting):
```
out = ac_Highboost( I, s, alpha )  
  I -- input matrix to perform unsharp on
  s -- blur filter size
  alpha -- unsharp coefficient
  
  out -- sharpened image
```

### ac_Unsharp.m  
Used to sharpen the image using the unsharp masking technique.  Operates on multi-channel images:
```
out = ac_Unsharp( I, s, alpha )  
  I -- input matrix to perform unsharp on
  s -- blur filter size
  alpha -- unsharp coefficient
  
  out -- sharpened image
```

### ac_Disk.m  
Used to create a disk filter: 
```
out = ac_Disk( outer, inner, [offset_x offset_y])  
  outer -- square size (width=height) of total filter
  inner -- radius of inner disk
  offset -- offset_x, offset_y: amount to shift the created disk (note that x is rows, y is cols)
  
  out -- zero padded disk filter
```

### ac_Square.m  
Used to create a square filter:
```
out = ac_Square( outer, inner, [offset_x offset_y])  
  outer -- square size (width=height) of total filter  
  inner -- 'radius' of inner square
  offset -- offset_x, offset_y: amount to shift the created square (note that x is rows, y is cols)
  
  out -- zero padded square filter
```

### ac_Nonmax.m  
Used to perform non-maximal suppression:
```
out = ac_Nonmax( I, win )  
  I -- input matrix to perform NMS on
  win -- window size
  
  out -- non-max suppressed image
```



