
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
        [CA1,CH1,CV1,CD1] = dwt2(red,'db8');
        
        case 2 
        [CA1,CH1,CV1,CD1] = dwt2(green,'db8');
        
        case 3 
        [CA1,CH1,CV1,CD1] = dwt2(blue,'db8');
        
        otherwise
        fprintf('Invalid!\n' );
    end
    
    [CA2,CH2,CV2,CD2] = dwt2(CA1,'db8');
    [CA3,CH3,CV3,CD3] = dwt2(CA2,'db8');
    [CA4,CH4,CV4,CD4] = dwt2(CA3,'db8');
       
    H1var = Localvar(CH1);
    H2var = Localvar(CH2);
    H3var = Localvar(CH3);
    H4var = Localvar(CH4);
    
    V1var = Localvar(CV1);
    V2var = Localvar(CV2);
    V3var = Localvar(CV3);
    V4var = Localvar(CV4);
    
    D1var = Localvar(CD1);
    D2var = Localvar(CD2);
    D3var = Localvar(CD3);
    D4var = Localvar(CD4);
    
        
    H1wiener = Wiener(CH1, H1var , d0);
    H2wiener = Wiener(CH2, H2var , d0);
    H3wiener = Wiener(CH3, H3var , d0);
    H4wiener = Wiener(CH4, H4var , d0);
    
    V1wiener = Wiener(CV1, V1var , d0);
    V2wiener = Wiener(CV2, V2var , d0);
    V3wiener = Wiener(CV3, V3var , d0);
    V4wiener = Wiener(CV4, V4var , d0);
    
    D1wiener = Wiener(CD1, D1var , d0);
    D2wiener = Wiener(CD2, D2var , d0);
    D3wiener = Wiener(CD3, D3var , d0);
    D4wiener = Wiener(CD4, D4var , d0);
    
    [LL3] = idwt2(CA4,H4wiener,V4wiener,D4wiener,'db8');
    
    [LL2] = idwt2(LL3,H3wiener,V3wiener,D3wiener,'db8');

    [LL1] = idwt2(LL2,H2wiener,V2wiener,D2wiener,'db8');

    [Reconstructed] = idwt2(LL1,H1wiener,V1wiener,D1wiener,'db8');
   
    switch (l)
        case 1 
        inv_red = [Reconstructed];
        imshow(inv_red);
        case 2 
        inv_green = [Reconstructed];
        
        case 3 
        inv_blue = [Reconstructed];
        
        otherwise
        fprintf('Invalid!\n' );
    end
    end

    rgbImage = cat(3, inv_red, inv_green, inv_blue);

end
