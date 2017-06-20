clc;
close all;

    filename = 'C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Extracted Noise\Source.png';
    source_noise = imread(filename);
    source_noise = im2double(source_noise);
    filename = 'C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Extracted Noise\Identify.png';
    id_noise = imread(filename);
    id_noise = im2double(id_noise);
    for l = 1 : 3
    switch (l)
        case 1
          c = source_noise(:,:,1);
          v = id_noise(:,:,1);
          corr_noise = 0;
        
        case 2
          c = source_noise(:,:,2);
          v = id_noise(:,:,2);
          corr_noise_r = corr_noise;
          corr_noise = 0;
        case 3
          c = source_noise(:,:,3);
          v = id_noise(:,:,3);
          corr_noise_g = corr_noise;
          corr_noise = 0;
        otherwise
        fprintf('Invalid!\n' );
    end
    nc_mean = mean(mean(c));
    nv_mean = mean(mean(v));
    for ii=1:size(c,1)
      for jj=1:size(c,2)
        p1=c(ii,jj);
        p2=v(ii,jj);
        nc  = p1 - nc_mean;
        nv  = p2 - nv_mean;
        nv_norm = norm(nv);
        nc_norm = norm(nc);
        corr_noise = corr_noise + ( nv * nc ) / sqrt(nv_norm * nc_norm );
      end
    end
    corr_noise = corr_noise / (2048*2048);
    end

      corr_noise_final = (corr_noise_r+corr_noise_g+corr_noise)/3;
      disp(corr_noise_final);
  
