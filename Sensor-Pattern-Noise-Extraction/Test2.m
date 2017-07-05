clc;
close all;
maindir = 'E:\Ishaan\Video-Forensics-Resources\Video Frames\';
outFullFolder=fullfile('E:','Ishaan','Video-Forensics-Resources','Extracted Noise');
  for l = 1 : 2
    switch (l)
      case 1
        phone = 'Mi';

      case 2
        phone = 'Moto';

      otherwise
      fprintf('Invalid!\n' );
    end
      for k = 1 : 2

      %  Extract_Noise(strcat(maindir,phone,'\',k,'\'),strcat(outdir,phone,'\',k,'\'));
      Extract_Noise(strcat(maindir,phone,'\',num2str(k),'\'),fullfile(outFullFolder,phone,num2str(k)),strcat(phone,'_',num2str(k)));
    end
    end
