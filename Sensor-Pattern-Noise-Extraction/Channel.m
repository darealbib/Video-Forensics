clc;
close all;
srcFiles = dir('C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Video Frames\Ishaan Phone*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Video Frames\',srcFiles(i).name);
    I = imread(filename);
    figure, imshow(I);
    red = img(:,:,1);
    green = img(:,:,2); 
    blue = img(:,:,3);
    a = zeros(size(img, 1), size(img, 2));
    just_red = cat(3, red, a, a);
    just_green = cat(3, a, green, a);
    just_blue = cat(3, a, a, blue);
    



end
