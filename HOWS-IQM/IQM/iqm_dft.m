function [dft_m, dft_p] = iqm_dft(img)
img = double(img);
[R,C,K] = size(img);
%dft - spectral magnitude
dft_m = zeros(R,C,K); 

%dft - spectral phase
dft_p = zeros(R,C,K);

for u=1:R
    for v=1:C
        for k=1:K    
            sum = 0;
            for m=1:R
                for n=1:C
                    sum = sum + img(m,n,k)*exp(-2*pi*1i*m*u/R)*exp(-2*pi*1i*n*v/C);
                end
            end    
            dft_m(u,v,k) = sum;
            dft_p(u,v,k) = atan(sum);
        end        
    end
end
    