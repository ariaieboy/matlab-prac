function [result] = angle_check(first,second,third)
first = bwpropfilt(first,'Area',1);
first_ori = regionprops(first, {'Orientation'});
first_ori = abs(first_ori.Orientation);

second = bwpropfilt(second,'Area',1);
second_ori = regionprops(second, {'Orientation'});
second_ori = abs(second_ori.Orientation);

third = bwpropfilt(third,'Area',1);
third_ori = regionprops(third, {'Orientation'});
third_ori = abs(third_ori.Orientation);

result = (first_ori > 1) || (second_ori > 1) || (third_ori > 1) ;
end

