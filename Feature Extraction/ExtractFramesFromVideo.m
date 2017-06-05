folder=fullfile('D:', 'video forensics', '8th sem', 'trainingVideo', 'cam1-myPhone');

%filename=fullfile(folder,'1v.mp4');


count=1;
videoNumber=1;
videoFiles=dir('D:\video forensics\8th sem\trainingVideo\cam1-myPhone\*.mp4');
for num=1:length(videoFiles)
 
filename=fullfile(folder,videoFiles(num).name);
a=VideoReader(filename);

outputFolderName =strcat('Video  ', num2str(videoNumber));
outFullFolder=fullfile('D:', 'video forensics', '8th sem', 'trainingFrame', 'cam1-myPhone', outputFolderName);
if ~exist(outFullFolder, 'dir')
              mkdir(outFullFolder);
else
    sprintf('\nDirectory exists');
end

for i=1:a.NumberOfFrames
   outfilename=strcat('Frame ',num2str(count),'.jpg');
   outfilepath=fullfile(outFullFolder, outfilename);
   img=read(a,i);
   imwrite(img, outfilepath);
   count=count+1;
   %sprintf('\nWritten frame number %d', count);
end
videoNumber=videoNumber+1;
end