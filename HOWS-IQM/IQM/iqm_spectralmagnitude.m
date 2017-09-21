function [M] = iqm_spectralmagnitude(dft_m1, dft_m2)
dft_m1 = double(dft_m1);
dft_m2 = double(dft_m2);
[R,C,K]=size(dft_m1);
dft=(dft_m1 - dft_m2) .^ 2;
SUM=zeros(R,C);
for k=1:K
   SUM(:,:)=SUM(:,:)+dft(:,:,k);
end
M=sum(sum(SUM))/(R*C*K);