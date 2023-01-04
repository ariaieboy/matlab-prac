function [result] = blackMissPlaceDetector(black_mask)
length = sum(black_mask,2);
nonzero = nonzeros(length);
[x,ind] = max(nonzero);
[w,~] = size(nonzero);
result = w/2 < ind;
end

