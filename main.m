clear all;
image = imread('pictures\2021-12-13_15-19-09.jpg');
[yellow_mask,yellow_height] = yellowMask(image);
[blue_mask,blue_height] = blueMask(image);
wmask = whiteMask(image);
se = strel("square",5);


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

white = imopen(wmask,se);
white = bwpropfilt(white,'Area',1);
x = sum(white,2);
[whiteIndex,ColNrs] = find(x>0);
whiteHeigth = mean(whiteIndex);
red = resimage(:,:,1);
green = resimage(:,:,2);
blue = resimage(:,:,3);
red(white == 1)=150;
green(white==1)=0;
blue(white==1)=0;
resimage = cat(3,red,green,blue);

gray = rgb2gray(resimage);
%resyellow = imclose(yellow,struct)
%resblue = imclose(blue,struct)
imshow(resimage)