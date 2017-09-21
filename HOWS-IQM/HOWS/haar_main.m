function haar_main(dirname, outputfile, stindx)
clc;
close all;
%Read Image

list_img = dir(strcat(dirname,'*.png'));
total_img = size(list_img,1);
crop_half_size = [256 256];
%img = imread('C:\Users\Public\Pictures\Sample Pictures\Jellyfish.jpg');
if total_img == 0
    display('Images not found');
    exit();
end
haar_level = 3;
no_division = 3;
tot_sub_img = no_division * haar_level;
for im=stindx:total_img
    %Read Image
    filename = strcat(dirname,list_img(im).name);
    img_sample = imread(filename);
    img_sample = im2double(img_sample);
    display(['Processing "',filename,'"']);

    %Crop Image
    %M,N,C <= No. of Rows, Cols, Color Channels
    [M,N,C] = size(img_sample);
    si = M/2 - crop_half_size(1) + 1;
    sj = N/2 - crop_half_size(2) + 1;
    ei = si + crop_half_size(1)*2 - 1;
    ej = sj + crop_half_size(2)*2 - 1;
    img_sample = img_sample(si:ei, sj:ej,:);
    [M,N,C] = size(img_sample);
    %Compute Haar_Wavelet

    if(C==3)
        img_sample=rgb2gray(img_sample);
    end

    [IMGBOUND,wave_img] = haar_wavelet(img_sample, haar_level);
    %Extract Haar_Wavelet Image H, V, D separately for each level
    eimg = haar_extract(wave_img, IMGBOUND);
    %Compute Measures
    MEAN = zeros(1,tot_sub_img);
    VAR = zeros(1,tot_sub_img);
    SKEWNESS = zeros(1,tot_sub_img);
    KURTOSIS = zeros(1,tot_sub_img);
    for row=1:size(eimg,1)
        cur_inx = (row-1)*size(eimg,2);
        for col=1:size(eimg,2)
            cur_inx = cur_inx + 1;
            cur_img = double(eimg{row,col});
            MN = size(cur_img,1) * size(cur_img,2);
            mean = sum(sum(cur_img))/MN;
            var = sum(sum((cur_img - mean).^2))/(MN-1);
            stdev = sqrt(var);
            skewness = sqrt(MN/(MN-1))* sum(sum((cur_img - mean).^3))/(MN * stdev^3);
            kurtosis = sum(sum((cur_img - mean).^4))/(MN * stdev^4)-3;
            MEAN(cur_inx) = mean;
            VAR(cur_inx) = var;
            SKEWNESS(cur_inx) = skewness;
            KURTOSIS(cur_inx) = kurtosis;
        end
    end
    DATASET = [MEAN VAR SKEWNESS KURTOSIS];
    %Write into excel sheet
    xlswrite(strcat(dirname,strcat(outputfile,'.xlsx')), DATASET, 1, strcat('A',int2str(im)));
end
