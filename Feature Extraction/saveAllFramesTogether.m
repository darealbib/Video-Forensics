counter=0;
outPath=dir('D:\video forensics\roddur_phone\training_frame_all');
outFolder=fullfile('D:','video forensics','roddur_phone','training_frame_all');
inPath=dir('D:\video forensics\roddur_phone\training_frame\Video*');
inFolder=fullfile('D:','video forensics','roddur_phone','training_frame');
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