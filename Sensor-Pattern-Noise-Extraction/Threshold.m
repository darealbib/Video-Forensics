clc;
clear all;
close all;
source_dir = 'E:\Ishaan\Video-Forensics-Resources\Correlation Coefficient\';
outFullFolder=fullfile('E:','Ishaan','Video-Forensics-Resources','Correlation Coefficient');
%srcFiles = dir(strcat(source_dir,'*.xlsx'));
  %  Correlate_Images(strcat(source_dir,phone,'\','1','\'),l,fullfile(outFullFolder));
filename = strcat(source_dir,'Correlation_Coefficient.xlsx');
  for i = 1 : 3
    data = xlsread(filename,i);


  end

%    if ~exist(outfold, 'dir')
%                  mkdir(outfold);
%    else
%        sprintf('\n Directory exists');
%    end
%    xlswrite(fullfile(outfold,'Correlation_Coefficient.xlsx'),correlation_values,sheet);
%
