function [O1, O2] = iqm_laplacian(img1, img2)
img1 = double(img1);
img2 = double(img2);
[R,C,K]=size(img1);
O1 = zeros(R,C,K);
O2 = zeros(R,C,K);
for k=1:K
    for r=1:R;
        for c=1:C
            if r>1 
                O1(r,c,k) = O1(r,c,k) + img1(r-1,c);
                O2(r,c,k) = O2(r,c,k) + img2(r-1,c);
            end
            if r<R
                O1(r,c,k) = O1(r,c,k) + img1(r+1,c);
                O2(r,c,k) = O2(r,c,k) + img2(r+1,c);
            end
            if c>1 
                O1(r,c,k) = O1(r,c,k) + img1(r,c-1);
                O2(r,c,k) = O2(r,c,k) + img2(r,c-1);
            end
            if c<C
                O1(r,c,k) = O1(r,c,k) + img1(r,c+1);
                O2(r,c,k) = O2(r,c,k) + img2(r,c+1);
            end
            O1(r,c,k) = O1(r,c,k) - 4*img1(r,c);
            O2(r,c,k) = O2(r,c,k) - 4*img2(r,c);
        end
    end
end