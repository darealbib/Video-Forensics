function [M] = iqm_czekanowski(img1, img2)
img1 = double(img1);
img2 = double(img2);
[R,C,K] = size(img1);
N2 = R*C;
SUM1 = zeros(R,C);
SUM2 = zeros(R,C);
MIN = min(img1,img2);
%display(size(MIN));
SUM = img1 + img2;
for k=1:K
    SUM1 = SUM1 + MIN(:,:,k);
    SUM2 = SUM2 + SUM(:,:,k);    
end
SUM = (2 .* SUM1) ./ SUM2;
SUM(isnan(SUM))=0;
SUM = 1 - (SUM);
M = sum(sum(SUM)) / N2;