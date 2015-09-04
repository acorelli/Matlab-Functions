<h1>Intensifies.m</h1>

Used for creating the "X intensifies" image macro gifs  
Usage:
````
intensifies( infile, outfile, range, topstring, bottomstring )
````
```
infile 		-- 	string to path of the input image
outfile 	--	string to the path of the output gif
range		--	maximum pixel displacement when jittering
topstring	--	text to be displayed at top of the macro
bottomstring	--	text to be displayed at the bottom of the macro
```
Example:

Input File: 'baboon.jpg' (resized from 512x512)  
<img src="baboon.jpg" width = 256 height = 256>
````
intensifies( 'baboon.jpg', 'baboon.gif', 3, 'BABOON', 'INTENSIFIES' ) 
````

Output File: 'baboon.gif' (resized from 512x512)  
<img src="baboon.gif" width = 256 height = 256>
