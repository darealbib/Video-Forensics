clc;
close all;
maindir = 'E:\Ishaan\Video-Forensics-Resources\Extracted Noise\';
outFullFolder=fullfile('E:','Ishaan','Video-Forensics-Resources','Extracted Noise');
  for l = 1 : 3
    switch (l)
      case 1
        phone = 'iphone_6s';

      case 2
        phone = 'iphone_6s_plus';

      case 3
        phone = 'samsung_j7_prime';

      otherwise
      fprintf('Invalid!\n' );
    end
      Extract_Noise(strcat(maindir,phone,'\'),fullfile(outFullFolder,phone),phone);
    end
