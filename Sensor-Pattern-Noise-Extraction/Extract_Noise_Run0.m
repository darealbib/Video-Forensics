clc;
clear all;
close all;
maindir = 'E:\Ishaan\Video-Forensics-Resources\Video Frames\';
outFullFolder=fullfile('E:','Ishaan','Video-Forensics-Resources','Extracted Noise');
  for l = 1 : 5
    switch (l)
      case 1
        phone = 'CanonA640';

      case 2
        phone = 'Kodak';

      case 3
        phone = 'Sony_H50';

      case 4
         phone = 'Nikon_D200';

      case 5
          phone = 'sony_t77';

      otherwise
      fprintf('Invalid!\n' );
    end
      for k = 2 : 2
        Extract_Noise(strcat(maindir,phone,'\',num2str(k),'\'),fullfile(outFullFolder,phone,num2str(k)),strcat(phone,'_',num2str(k)));
    end
    end
