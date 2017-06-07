
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
    

    H1var = Localvar(CH1);

    
    V1var = Localvar(CV1);
    
    
    D1var = Localvar(CD1);

    
        
    H1wiener = Wiener(CH1, H1var , d0);

    V1wiener = Wiener(CV1, V1var , d0);

    D1wiener = Wiener(CD1, D1var , d0);



    [Reconstructed] = idwt2(CA1,CH1,CV1,CD1,'db8');
   
    switch (l)
        case 1 
        inv_red = [Reconstructed];
        
        case 2 
        inv_green = [Reconstructed];
        
        case 3 
        inv_blue = [Reconstructed];
        
        otherwise
        fprintf('Invalid!\n' );
    end
    end
    rgbImage = cat(3, inv_red, inv_green, inv_blue);
    imshow(rgbImage);
end
