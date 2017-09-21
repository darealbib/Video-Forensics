function [M] = iqm_laplacianmse(img1, img2)
img1 = double(img1);
img2 = double(img2);
[R,C,K] = size(img1);
[O1, O2] = iqm_laplacian(img1, img2);
NUM = (O1 - O2).^2;
DEN = O1 .^ 2;
M = 0;
for k=1:K
    M = M + (sum(sum(NUM(:,:,k))) ./ sum(sum(DEN(:,:,k))));
end
M = M / K;