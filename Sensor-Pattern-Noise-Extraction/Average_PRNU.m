function Average_PRNU(dirname, outfold, phonemodel)
  clc;
  close all;
  srcFiles = dir(strcat(dirname,'*.png'));
  % the folder in which ur images exists
  Noise=zeros(2048,2048);
  for i = 1 : length(srcFiles)
      filename = strcat(dirname,srcFiles(i).name);
      img = imread(filename);
      img = im2double(img);
      Noise = Noise + img;
  end

  Noise = Noise/length(srcFiles);
  if ~exist(outfold, 'dir')
                mkdir(outfold);
  else
      sprintf('\n Directory exists');
  end
  imwrite(Noise, fullfile(outfold,strcat(phonemodel,'_Noise_Final.png')));
