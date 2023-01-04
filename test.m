%%
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);
red(yellow_mask == 1)=150;
green(yellow_mask==1)=0;
blue(yellow_mask==1)=0;
resimage = cat(3,red,green,blue);

red = resimage(:,:,1);
green = resimage(:,:,2);
b = resimage(:,:,3);
red(blue_mask == 1)=150;
green(blue_mask==1)=0;
b(blue_mask==1)=0;
resimage = cat(3,red,green,b);

red = resimage(:,:,1);
green = resimage(:,:,2);
blue = resimage(:,:,3);
red(white_mask == 1)=150;
green(white_mask==1)=0;
blue(white_mask==1)=0;
resimage = cat(3,red,green,blue);
%% 
clear all
image = imread('pictures\2021-12-13_15-19-09.jpg');
image = rgb2gray(image);

%imshow(bw);