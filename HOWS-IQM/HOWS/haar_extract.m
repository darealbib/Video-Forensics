function [eimg] = haar_extract(img, IMGBOUND)
% img = output image of haar_wavelet()
% IMGBOUND = image seperation boundary of each level - output from
% haar_wavelet()
%
% IMGBOUND(:,:,1) => level 1
%    [ Column Starting Point        Column Ending Point     ]  H
%    [ Row Starting Point           Row Ending Point        ]  V
% IMGBOUND(:,:,2) => level 2
%    [ Column Starting Point        Column Ending Point     ]  H
%    [ Row Starting Point           Row Ending Point        ]  V
% and so on
% used to extract horizontal, vertical and diagonal image of each level
%
% eimg = output of haar_extract contains H,V & D image of all level
%        HVD image of each level varies in size
%        descrease in size by 2 while increase in level
%    { [H1]  [V1]  [D1] }
%    { [H2]  [V2]  [D2] }
%            ...
%    { [HL]  [VL]  [DL] }

[r,c,level] = size(IMGBOUND);
eimg = cell(level,3);
for i=1:level
    eimg{i,1} = img(1:IMGBOUND(2,1,i)-1, IMGBOUND(1,1,i):IMGBOUND(1,2,i));
    eimg{i,2} = img(IMGBOUND(2,1,i):IMGBOUND(2,2,i), 1:IMGBOUND(1,1,i)-1);    
    eimg{i,3} = img(IMGBOUND(2,1,i):IMGBOUND(2,2,i), IMGBOUND(1,1,i):IMGBOUND(1,2,i));
    %display(size(eimg{i,1}));
    %display(size(eimg{i,2}));
    %display(size(eimg{i,3}));
end


end
