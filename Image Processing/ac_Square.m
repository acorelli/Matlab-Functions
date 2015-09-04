function [s] = ac_Square(outer, inner, offset)

s = zeros(outer);
s(floor(end/2)+offset(1),floor(end/2)+offset(2)) = 1;

s = conv2(s,ones(inner),'same');
end
