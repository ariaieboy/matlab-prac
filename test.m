clear all
image = imread('pictures\2021-12-13_15-19-09.jpg');
image = rgb2gray(image);
[bw,image]=maskBlack(image);
struct = strel("square",5);
bw = imopen(bw,struct);
length = sum(bw,2);
nonzero = nonzeros(length);
[x,ind] = max(nonzero);
[w,h] = size(nonzero);
result = w/2 < x;
%imshow(bw);