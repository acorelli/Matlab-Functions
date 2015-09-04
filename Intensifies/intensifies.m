%%
%--------------------------------------------------------------------------
% Function Name: Intensifies
% Author: Alexander Corelli
% Date: 3/16/2014
%
%--------------------------------------------------------------------------
% Description: Used to make gifs of [ X intensifies ] memes
%
%--------------------------------------------------------------------------
% Parameters:
% infile        - filename of background image
% outfile       - destination file for finished gif
% range         - max distance for shaking, set to 0 for stationary
% topstring     - top line of meme text
% bottomstring  - bottom line of meme text
%--------------------------------------------------------------------------
% Example:
% intensifies('corelli.jpg','corelli.gif',20,'','[Corelli Intensifies]')
%
function [] = intensifies(infile,outfile,range,topstring,bottomstring)

% Read in the image
I = imread(infile);

% Calculate the rescaling ratio
s = size(I);
dim = 512;
ratio = dim/s(1);

% Resize image and split into color channels
I = imresize(I,[dim NaN]);

% If I is grayscale, cat it to rgb
if size(I,3) == 1
    I = cat(3,I,I,I);
end

r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);

% rescale the range
range = floor(range*ratio);

s = size(r);

% Set fontsize to show all text
fontsize1 = min( s(1)/10, 1.0*s(2)/(length(topstring)) );
fontsize2 = min( s(1)/10, 1.0*s(2)/(length(bottomstring)) );

% set black border around text
border = 7;


% Calculate text position
xstr = double(4.8*s(2)/9);
ystr1 = s(1)*.1;
ystr2 = s(1)*.9;

% Convert caption to uppercase
topstring = upper(topstring);
bottomstring = upper(bottomstring);

% Draw the text on a blank image
f = figure('visible', 'off');
T = uint8(zeros(s-1));
imshow(T)
text( xstr,ystr1, ['\color{white}{' topstring '}'], 'FontSize', fontsize1, 'HorizontalAlignment', 'center','fontname','fixedwidth','interpreter','tex')
text( xstr,ystr2, ['\color{white}{' bottomstring '}'], 'FontSize', fontsize2, 'HorizontalAlignment', 'center','fontname','fixedwidth','interpreter','tex')
tframe = getframe;
close(f)

% Erode the edge of the text
tframe2 = imerode(255 - tframe.cdata,ones(border),'same');

% Construct the mask
mask = tframe2 - tframe.cdata;

% Set mask to proper size
mask = mask(1:dim,1:size(r,2));

mask(1:5,:,:) =       255;
mask(end-5:end,:,:) = 255;
mask(:,1:5,:) =       255;
mask(:,end-5:end,:) = 255;

% Threshold mask
mask = uint8(mask>127);

% Figure for making the frames
f = figure('visible', 'off');
for i = 1:max(1,(range>0)*20)
    
    % Use convolution method with randomly shifted impulse ±range/2
    o = zeros(s(1),s(2));
    
    % Alternate frames with offset image
    if mod(i,2)
        if range > 0
            o( floor(end/2) + randi(range,1,1)-floor(range/2), floor(end/2) + randi(3*range,1,1) - floor(3*range/2)) = 1;
        else
            
            o( floor(end/2), floor(end/2) ) = 1;
        end
    else
        o( floor(end/2), floor(end/2) ) = 1;
    end
    
    % Shift 2nd image
    r2 = uint8(conv2(double(r),o,'same'));
    g2 = uint8(conv2(double(g),o,'same'));
    b2 = uint8(conv2(double(b),o,'same'));
    
    % Set text mask to zeros
    r2 = r2.*mask;
    g2 = g2.*mask;
    b2 = b2.*mask;
    
    % merge channels
    I2 = cat(3,r2,g2,b2);    
    
    imshow(I2)
    
    % Place white text inside the black outline
    text( xstr, ystr1, ['\color{white}{' topstring '}'], 'FontSize', fontsize1, 'HorizontalAlignment', 'center','fontname','fixedwidth','interpreter','tex')
    text( xstr, ystr2, ['\color{white}{' bottomstring '}'], 'FontSize', fontsize2, 'HorizontalAlignment', 'center','fontname','fixedwidth','interpreter','tex')
    
    % Construct output data
    frame2 = getframe;
    im = frame2im(frame2);
    [imind2,cm2] = rgb2ind(im,256);
     
    % Create output if first frame
    if i == 1
        imwrite(imind2,cm2,outfile,'gif','writemode','overwrite','LoopCount',inf,'DelayTime',0);
    else
        imwrite(imind2,cm2,outfile,'gif','writemode','append','DelayTime',0);
    end
    
end
close(f)
end