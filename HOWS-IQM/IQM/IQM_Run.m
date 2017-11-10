clc;
clear all;
close all;
maindir = 'E:\Ishaan\Video-Forensics-Resources\Video Frames\';
outFullFolder=fullfile('E:','Ishaan','Video-Forensics-Resources','Extracted Noise');
  for l = 1 : 1
    switch (l)
      %  case 1
      %    phone = 'iphone_6s';
      %
      % case 2
      %   phone = 'iphone_6s_plus';
      %
      % case 3
      %   phone = 'samsung_j7_prime';
      %
      % case 4
      %    phone = 'oneplus_3t';

       case 1
         phone = 'CanonA640';

       % case 2
       %   phone = 'Kodak';
       %
       % case 3
       %   phone = 'Sony_H50';
       %
       % case 4
       %    phone = 'Nikon_D200';
       %
       % case 5
       %     phone = 'sony_t77';

      otherwise
      fprintf('Invalid!\n' );
    end
      for k = 1 : 1
        iqm_main(strcat(maindir,phone,'\',num2str(k),'\'),strcat(phone,'_',num2str(k)),1);
    end
    end
