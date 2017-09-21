function [U] = iqm_hvsdct(img)
img = double(img);
[R,C,K]=size(img);
hvs = zeros(R,C);
U = zeros(R,C,K);
for u=1:R
    for v=1:C
        p = (u^2+v^2)^0.5;
        if p < 7
            hvs(u,v)=0.05*exp(p^0.554);
        else
            hvs(u,v)=exp(-9*(log10(p)-log10(9))^23);
        end        
    end
end
for k=1:K
    U(:,:,k) = idct(hvs * dct(img(:,:,k)));
end