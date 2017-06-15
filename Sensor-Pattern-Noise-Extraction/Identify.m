clc;
close all;

    filename = 'C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Extracted Noise\Noise.png';
    source_noise = imread(filename);
    filename = 'C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Extracted Noise\Identify.png';
    id_noise = imread(filename);
    nc_mean = mean(mean(double(source_noise)));
    nv_mean = mean(mean(double(id_noise)));
    nc = double(source_noise) - nc_mean;
    nv  = double(id_noise) - nv_mean;
    red = img(:,:,1);
    green = img(:,:,2);
    blue = img(:,:,3);
    nv_norm = norm(nv);
    nc_norm = norm(nc);

    corr_noise = ( nv * nc ) / (nv_norm * nc_norm );

    disp(corr_noise);
