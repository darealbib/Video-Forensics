clc;
clear all;
close all;
maindir = 'E:\Ishaan\Video-Forensics-Resources\Video Frames\';
outFullFolder=fullfile('E:','Ishaan','Video-Forensics-Resources','Extracted Noise');
  for l = 1 : 4
    switch (l)
      case 1
        phone = 'iphone_6s';

      case 2
        phone = 'iphone_6s_plus';

      case 3
        phone = 'samsung_j7_prime';

      case 4
         phone = 'oneplus_3t';

      otherwise
      fprintf('Invalid!\n' );
    end
      for k = 1 : 5
        iqm_main(strcat(maindir,phone,'\',num2str(k),'\'),strcat(phone,'_',num2str(k)),1);
    end
    end
