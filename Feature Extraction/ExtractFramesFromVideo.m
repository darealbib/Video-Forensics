folder=fullfile('C:', 'Users', 'Ishaan Dali', 'OneDrive', 'Documents','Assignments - Projects','Research','Video-Forensics','Videos');

%filename=fullfile(folder,'1v.mp4');
%ffmpeg -i in.mp4 -vf select="eq(pict_type\,PICT_TYPE_I)" -vsync 0 i%03d.png

count=1;
videoNumber=1;
videoFiles=dir('C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Videos\*.mp4');
for num=1:length(videoFiles)

filename=fullfile(folder,videoFiles(num).name);
a=VideoReader(filename);

outputFolderName =strcat('Video  ', num2str(videoNumber));
outFullFolder=fullfile('C:', 'Users', 'Ishaan Dali', 'OneDrive', 'Documents','Assignments - Projects','Research','Video-Forensics','Video Frames','Ishaan Phone');
if ~exist(outFullFolder, 'dir')
              mkdir(outFullFolder);
else
    sprintf('\n Directory exists');
end

for i=1:a.NumberOfFrames
   outfilename=strcat('Frame ',num2str(count),'.png');
   outfilepath=fullfile(outFullFolder, outfilename);
   img=read(a,i);
   imwrite(img, outfilepath);
   count=count+1;
   %sprintf('\nWritten frame number %d', count);
end
videoNumber=videoNumber+1;
end
