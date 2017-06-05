counter=0;
outPath=dir('C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Video Frames All');
outFolder=fullfile('C:', 'Users', 'Ishaan Dali', 'OneDrive', 'Documents','Assignments - Projects','Research','Video-Forensics','Video Frames All');
inPath=dir('C:\Users\Ishaan Dali\OneDrive\Documents\Assignments - Projects\Research\Video-Forensics\Video Frames*');
inFolder=fullfile('C:', 'Users', 'Ishaan Dali', 'OneDrive', 'Documents','Assignments - Projects','Research','Video-Forensics','Videos');
for i=1:length(inPath)
    inVideo=fullfile(inFolder,inPath(i).name);
    inFramePathName=strcat(inVideo,'\*.jpg')
    inFramePath=dir(inFramePathName);
    for j=1:length(inFramePath)
        inFrame=fullfile(inVideo, inFramePath(j).name);
        I=imread(inFrame);
        outFileName=strcat(outFolder,'\',inFramePath(j).name);
        imwrite(I,outFileName);
        counter=counter+1;
    end
    
end