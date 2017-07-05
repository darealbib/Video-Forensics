clc;
close all;

    filename = 'C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Extracted Noise\Source.png';
    source_noise = imread(filename);
    source_noise = im2double(source_noise);
    filename = 'C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Extracted Noise\Identify.png';
    id_noise = imread(filename);
    id_noise = im2double(id_noise);

    source_noise = rgb2gray(source_noise);
    id_noise = rgb2gray(id_noise);
    corr_noise_final = corr2(source_noise,id_noise);
  %   for l = 1 : 3
  %   switch (l)
  %       case 1
  %         c = source_noise(:,:,1);
  %         v = id_noise(:,:,1);
  %         corr_noise_r = corr2(c,v);
  %
  %       case 2
  %         c = source_noise(:,:,2);
  %         v = id_noise(:,:,2);
  %         corr_noise_g = corr2(c,v);
  %       case 3
  %         c = source_noise(:,:,3);
  %         v = id_noise(:,:,3);
  %         corr_noise_b = corr2(c,v);
  %
  %       otherwise
  %       fprintf('Invalid!\n' );
  %   end
  % end
  %
  %   corr_noise_final = (corr_noise_r+corr_noise_g+corr_noise_b)/3;
    disp(corr_noise_final);
