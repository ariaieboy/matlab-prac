clear all;
image = imread('pictures\2021-11-03_13-58-53.jpg');
[yellow_mask,yellow_height] = yellowMask(image);
[blue_mask,blue_height] = blueMask(image);
[white_mask,white_height] = whiteMask(image);
[black_mask,black_height]=maskBlack(image);

length = sum(black_mask,2);
nonzero = nonzeros(length);
[x,ind] = max(nonzero);
[w,h] = size(nonzero);
result = w/2 < x;
order = blue_height < white_height < yellow_height;
if (order)
    order_title = "order: correct";
else
    order_title = "order: wrong";
end

subplot(1,1,1);imshow(image);title(order_title);