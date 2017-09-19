function Correlate_Images(dirname, sheet, outfold)
  clc;
  close all;
  srcFiles = dir(strcat(dirname,'*.png'));
  filename = strcat(dirname,srcFiles(1).name);
  source_noise = imread(filename);
  source_noise = im2double(source_noise);
  source_noise = rgb2gray(source_noise);
  correlation_values=[length(srcFiles)-1];
  for i = 2 : length(srcFiles)
    filename = strcat(dirname,srcFiles(i).name);
    id_noise = imread(filename);
    id_noise = im2double(id_noise);
    id_noise = rgb2gray(id_noise);
    corr_noise_final = corr2(source_noise,id_noise);
    correlation_values(i-1)=corr_noise_final;
  end
  if ~exist(outfold, 'dir')
                mkdir(outfold);
  else
      sprintf('\n Directory exists');
  end
  xlswrite(fullfile(outfold,'Correlation_Coefficient.xlsx'),correlation_values,sheet);
