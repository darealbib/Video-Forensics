function [IMGBOUND, wavelet_img] = haar_wavelet(img, level)
% IMGBOUND(:,:,1) => level 1
%    [ Column Starting Point        Column Ending Point     ]  H
%    [ Row Starting Point           Row Ending Point        ]  V
% IMGBOUND(:,:,2) => level 2
%    [ Column Starting Point        Column Ending Point     ]  H
%    [ Row Starting Point           Row Ending Point        ]  V
% and so on
% used to extract horizontal, vertical and diagonal image of each level
%
% wavelet_img => final output image contains information about all the
% levels
% a => decomposed image
%img=rgb2gray(img);
%img = img(:,:,1);
[R, C] = size(img);
f=1;
IMGBOUND = zeros(2,2,level);

a = img;
for p=1:level
[r,c]=size(a);
z=a;
    %Horizontal Difference
    IMGBOUND(1,1,p)=(c/2+1);
    for i=1:1:r
        k=1;
        t=IMGBOUND(1,1,p);
        for j=1:2:c
            avg=(a(i,j)+a(i,j+1))/2;
            dif=(a(i,j)-a(i,j+1))/2;
            z(i,k)=avg;
            z(i,t)=dif;
            k=k+1;
            t=t+1;            
        end        
    end
    IMGBOUND(1,2,p) = t-1;    
    
    %Vertical Difference
    a=z;    
    IMGBOUND(2,1,p) = (r/2+1);
    for j=1:1:c
        k=1;
        t=IMGBOUND(2,1,p);        
        for i=1:2:r
            avg=(a(i,j)+a(i+1,j))/2;
            dif=(a(i,j)-a(i+1,j))/2;
            z(k,j)=avg;
            z(t,j)=dif;
            k=k+1;
            t=t+1;
        end
    end    
    IMGBOUND(2,2,p) = t-1;
    
    if p==1;
        wavelet_img=z;
    else                
        wavelet_img(1:R/(2^f),1:C/(2^f))=z;
        f=f+1;
    end
    a=z(1:R/(2^p),1:C/(2^p));    
    %imshow(wavelet_img);
    %hold on;
end

end