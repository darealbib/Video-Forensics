clc;
close all;

    filename = 'C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Extracted Noise\Noise.png';
    source_noise = imread(filename);
    filename = 'C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Extracted Noise\Identify.png';
    id_noise = imread(filename);

    corr_noise = corr2(source_noise,id_noise);


    disp(corr_noise);
