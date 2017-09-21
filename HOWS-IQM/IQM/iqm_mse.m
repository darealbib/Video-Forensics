function [M] = iqm_mse(img1, img2)
img1 = double(img1);
img2 = double(img2);
[R,C,K] = size(img1);
N2 = R*C;
M = 0;
for k=1:K
    M = M + sqrt(sum(sum(abs(img1(:,:,k) - img2(:,:,k)).^2)) / N2);
end
M = M / K;