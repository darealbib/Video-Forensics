clc;
close all;
clear all;
source_dir = 'E:\Ishaan\Video-Forensics-Resources\Extracted Noise\';
outFullFolder=fullfile('E:','Ishaan','Video-Forensics-Resources','Correlation Coefficient');
for l = 1 : 1
  switch (l)
    % case 1
    %   phone = 'iphone_6s';
    %
    % case 2
    %   phone = 'iphone_6s_plus';
    %
    % case 3
    %   phone = 'samsung_j7_prime';

  case 1
      phone = 'Test1';

    otherwise
    fprintf('Invalid!\n' );
  end
    Correlate_Images(strcat(source_dir,phone,'\','1','\'),l,fullfile(outFullFolder));
  end
