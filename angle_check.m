function [result] = angle_check(first,second,third)
first = bwpropfilt(first,'Area',1);
first_ori = regionprops(first, {'Orientation'});
if(length(first_ori))
first_ori = abs(first_ori.Orientation);
else
    first_ori = 0;
end

second = bwpropfilt(second,'Area',1);
second_ori = regionprops(second, {'Orientation'});
if(length(second_ori))
second_ori = abs(second_ori.Orientation);
else
    second_ori = 0;
end

third = bwpropfilt(third,'Area',1);
third_ori = regionprops(third, {'Orientation'});
if(length(third_ori))
third_ori = abs(third_ori.Orientation);
else
    third_ori = 0;
end

result = (first_ori > 1) || (second_ori > 1) || (third_ori > 1) ;
end

