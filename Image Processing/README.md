Image Processing Helper Functions


<h3>ac_Disk.m</h3>  
Used to create a disk filter: 
```
ac_Disk( outer, inner, [offset_x offset_y])  
  outer -- square size (width=height) of total filter
  inner -- radius of inner disk
  offset -- offset_x, offset_y: amount to shift the created disk (note that x is rows, y is cols)
```

<h3>ac_Square.m</h3>  
Used to create a square filter:
```
ac_Square( outer, inner, [offset_x offset_y])  
  outer -- square size (width=height) of total filter  
  inner -- 'radius' of inner square
  offset -- offset_x, offset_y: amount to shift the created square (note that x is rows, y is cols)
```

<h3>ac_Nonmax.m</h3>  
Used to perform non-maximal supression:
```
ac_Nonmax( I, win )  
  I -- input matrix to perform NMS on
  win -- window size
```

<h3>ac_Unsharp.m</h3>  
Used to perform non-maximal supression.  Operates on multi-channel images:
```
ac_Unsharp( I, s, alpha )  
  I -- input matrix to perform unsharp on
  s -- blur filter size
  alpha -- unsharp coefficient
```
