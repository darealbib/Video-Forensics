function [M] = iqm_mas(img1, img2)
img1 = double(img1);
img2 = double(img2);
[R,C,K] = size(img1);
NUM = img1 .* img2;
SUM1 = zeros(R,C);
SUM2 = zeros(R,C);
SUM3 = zeros(R,C);
for k=1:K
    SUM1 = SUM1 + NUM(:,:,k);
    SUM2 = SUM2 + img1(:,:,k);
    SUM3 = SUM3 + img2(:,:,k);
end
SUM = SUM1 ./ (SUM2 .* SUM3);
SUM(isnan(SUM)) = 0;
SUM = (2/pi) .* acos(SUM);
M = sum(sum(SUM));
M = 1 - (M / (R*C));