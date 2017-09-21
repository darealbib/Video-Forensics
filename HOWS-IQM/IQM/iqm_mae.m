function [M] = iqm_mae(img1, img2)
img1 = double(img1);
img2 = double(img2);
[R,C,K] = size(img1);
N2 = R*C;
M = 0;
for k=1:K
    M = M + (sum(sum(abs(img1(:,:,k) - img2(:,:,k)))) / N2);
end
M = M / K;