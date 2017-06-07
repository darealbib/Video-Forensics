
clc;
close all;
srcFiles = dir('C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Video Frames All\*.jpg');
% the folder in which ur images exists
dwtmode('per');
d0=5;
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Video Frames All\',srcFiles(i).name);
    img = imread(filename);
    red = img(:,:,1);
    green = img(:,:,2);
    blue = img(:,:,3);
 
    for l = 1 : 3
   
    switch (l)
        case 1 
        [c,s] = wavedec2(red,4,'db8');
        [H,V,D] = detcoef2('all',c,s,j);
        A = appcoef2(c,s,'db8',1);
        case 2 
        [c,s] = wavedec2(green,4,'db8');
        [H,V,D] = detcoef2('all',c,s,j);
        A = appcoef2(c,s,'db8',1);
        case 3 
        [c,s] = wavedec2(blue,4,'db8');
        [H,V,D] = detcoef2('all',c,s,j);
        A = appcoef2(c,s,'db8',1);
        otherwise
        fprintf('Invalid!\n' );
    end
    
    for j = 1 : 4
    Himg = wcodemat(H,255,'mat',1);
    Vimg = wcodemat(V,255,'mat',1);
    Dimg = wcodemat(D,255,'mat',1);
    
    Hvar = Localvar(Himg);
    Vvar = Localvar(Vimg);
    Dvar = Localvar(Dimg);
        
    Hwiener = Wiener(Himg, Hvar , d0);
    Vwiener = Wiener(Vimg, Vvar , d0);
    Dwiener = Wiener(Dimg, Dvar , d0);
    
    X = idwt2(A,Hwiener,Vwiener,Dwiener,'db8');
    
    end
    end


end
