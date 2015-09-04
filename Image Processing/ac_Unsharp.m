function [out] = ac_Unsharp(I,s,alpha)

    I = im2double(I);

    h = fspecial('average',s);

    for i = 1:size(I,3)

        Ia = conv2(I(:,:,i),h,'same');

        mask = I(:,:,i) - Ia;

        out(:,:,i) = I(:,:,i) + alpha.*mask;
    end
    
end
