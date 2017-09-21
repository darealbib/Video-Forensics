function [M] = iqm_hvs(img1, img2)
img1 = double(img1);
img2 = double(img2);
[R,C,K]=size(img1);
M = sum(sum(sum(abs(iqm_hvsdct(img1) - iqm_hvsdct(img2)))) ./ sum(sum(iqm_hvsdct(img1)))) / K;