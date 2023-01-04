close all
clear all
clc
image = imread('pictures\black-ok.jpg');
[yellow_mask,yellow_height,im] = yellowMask(image);
[blue_mask,blue_height] = blueMask(image);
[white_mask,white_height] = whiteMask(image);
[black_mask,black_height] = maskBlack(image);

black_place = blackMissPlaceDetector(black_mask);

angle = angle_check(yellow_mask,blue_mask,white_mask);


order = (blue_height < white_height) && (white_height < yellow_height)&&(yellow_height < black_height);

if (order)
    order_title = "order: correct";
else
    order_title = "order: wrong";
end

if(black_place)
    black_title = "black: correct";
else
    black_title = "black: wrong";
end

if(angle)
    angle_title = "angle: wrong";
else
    angle_title = "angle: correct";
end

subplot(1,1,1);imshow(image);title(strcat(order_title,'  |',black_title,' | ',angle_title));xlabel('what');