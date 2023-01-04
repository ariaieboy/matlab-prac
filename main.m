clear all;
image = imread('pictures\what.jpg');
yellow = yellowMask(image);
bmask = blueMask(image);
wmask = whiteMask(image);
struct = strel("square",5);

yellow = imopen(yellow,struct);
x = sum(yellow,2);
[yellowIndex,ColNrs] = find(x>0);
yellowHeight = mean(yellowIndex);
red = image(:,:,1);
green = image(:,:,2);
blue = image(:,:,3);
red(yellow == 1)=150;
green(yellow==1)=0;
blue(yellow==1)=0;
resimage = cat(3,red,green,blue);

blue = imopen(bmask,struct);
x = sum(blue,2);
[bluIndex,ColNrs] = find(x>0);
blueHeight = mean(bluIndex);
red = resimage(:,:,1);
green = resimage(:,:,2);
b = resimage(:,:,3);
red(blue == 1)=150;
green(blue==1)=0;
b(blue==1)=0;
resimage = cat(3,red,green,b);

white = imopen(wmask,struct);
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