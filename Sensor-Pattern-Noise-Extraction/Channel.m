
clc;
close all;
srcFiles = dir('C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Video Frames\Ishaan Phone\*.jpg');
% the folder in which ur images exists
dwtmode('per');
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\Ishaan Dali\OneDrive\Documents\Assignment-Projects\Research\Video-Forensics\Video Frames\Ishaan Phone\',srcFiles(i).name);
    img = imread(filename);
    figure, imshow(img);
    red = img(:,:,1);
    green = img(:,:,2);
    blue = img(:,:,3);
    [c1,s1] = wavedec2(red,j,'db8');
    [c2,s2] = wavedec2(green,j,'db8');
    [c3,s3] = wavedec2(blue,j,'db8');
    for j = 1 : 4
    [H1,V1,D1] = detcoef2('all',c1,s1,j);
    [H2,V2,D2] = detcoef2('all',c2,s2,j);
    [H3,V3,D3] = detcoef2('all',c3,s3,j);
    H1img = wcodemat(H1,255,'mat',1);
    V1img = wcodemat(V1,255,'mat',1);
    D1img = wcodemat(D1,255,'mat',1);
    H2img = wcodemat(H2,255,'mat',1);
    V2img = wcodemat(V2,255,'mat',1);
    D2img = wcodemat(D2,255,'mat',1);
    H3img = wcodemat(H3,255,'mat',1);
    V3img = wcodemat(V3,255,'mat',1);
    D3img = wcodemat(D3,255,'mat',1);
    
    
    
    
    end


end
