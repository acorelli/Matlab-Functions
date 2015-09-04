<h1>Image Processing Helper Functions</h1>  


<h3>ac_Highboost.m</h3>  
Used to sharpen the image using the unsharp masking technique (highboosting):
```
out = ac_Highboost( I, s, alpha )  
  I -- input matrix to perform unsharp on
  s -- blur filter size
  alpha -- unsharp coefficient
  
  out -- sharpened image
```

<h3>ac_Unsharp.m</h3>  
Used to sharpen the image using the unsharp masking technique.  Operates on multi-channel images:
```
out = ac_Unsharp( I, s, alpha )  
  I -- input matrix to perform unsharp on
  s -- blur filter size
  alpha -- unsharp coefficient
  
  out -- sharpened image
```

<h3>ac_Disk.m</h3>  
Used to create a disk filter: 
```
out = ac_Disk( outer, inner, [offset_x offset_y])  
  outer -- square size (width=height) of total filter
  inner -- radius of inner disk
  offset -- offset_x, offset_y: amount to shift the created disk (note that x is rows, y is cols)
  
  out -- zero padded disk filter
```

<h3>ac_Square.m</h3>  
Used to create a square filter:
```
out = ac_Square( outer, inner, [offset_x offset_y])  
  outer -- square size (width=height) of total filter  
  inner -- 'radius' of inner square
  offset -- offset_x, offset_y: amount to shift the created square (note that x is rows, y is cols)
  
  out -- zero padded square filter
```

<h3>ac_Nonmax.m</h3>  
Used to perform non-maximal suppression:
```
out = ac_Nonmax( I, win )  
  I -- input matrix to perform NMS on
  win -- window size
  
  out -- non-max suppressed image
```



