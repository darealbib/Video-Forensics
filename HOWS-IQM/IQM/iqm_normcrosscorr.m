function [M] = iqm_normcrosscorr(img1, img2)
img1 = double(img1);
img2 = double(img2);
[R,C,K] = size(img1);
M = 0;
for k=1:K
    M = M + (sum(sum((img1(:,:,k) - img2(:,:,k)).^2)) / sum(sum(img1(:,:,k).^2)));
end
M = 1- (M / K);