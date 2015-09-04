function [s] = myDisk(outer, inner, offset)

s = zeros(outer);
s(floor(end/2)+offset(1)-1,floor(end/2)+offset(2)-1) = 1;

d = fspecial('disk',inner-1);
d = d./max(d(:));

s = conv2(s,d,'same');

end