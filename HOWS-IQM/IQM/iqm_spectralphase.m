function [M] = iqm_spectralphase(dft_p1, dft_p2)
dft_p1 = double(dft_p1);
dft_p2 = double(dft_p2);
[R,C,K]=size(dft_p1);
dft=(dft_p1 - dft_p2) .^ 2;
SUM=zeros(R,C);
for k=1:K
   SUM(:,:)=SUM(:,:)+dft(:,:,k);
end
M=sum(sum(SUM))/(R*C*K);