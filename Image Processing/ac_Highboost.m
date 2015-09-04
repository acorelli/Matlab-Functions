function [out] = ac_Highboost(I,s,alpha)

h = fspecial('average',s);

Ia = conv2(I,h,'same');

mask = I - Ia;

out = I + alpha.*mask;

end
