function [out] = nonmax(I, win)

K = ordfilt2(I,win*win,ones(win,win));

I = double(I);

out = I.*(K==I);

end