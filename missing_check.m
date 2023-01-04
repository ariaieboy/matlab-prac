function [result] = missing_check(mask)
mask = bwpropfilt(mask,'MajorAxisLength',[100,+Inf]);
mask = bwpropfilt(mask,'Area',1);
regions = regionprops(mask, {'Area'});
result = not(length(regions));
end

