function iqm_main(dirname, outputfile, stindx)
%Implementation of IQM
clc;
close all;

list_img = dir(strcat(dirname,'*.jpg'));
total_img = size(list_img,1);
crop_half_size = [256 256];

%img_sample = imread('C:\Users\Public\Pictures\Sample Pictures\Koala.jpg');
if total_img == 0
    display('Images not found');
    exit();
end

%Create temp directory
tempdir = strcat(dirname,'\temp');
mkdir(tempdir);
tempfile = strcat(tempdir,'\iqm_temp_jpeg_comp.jpg');

for im=stindx:total_img
    filename = strcat(dirname,list_img(im).name);
    img_sample = imread(filename);
    img_sample = im2double(img_sample);
    display(['Applying Filters on image: ',filename]);
    %M,N,C <= No. of Rows, Cols, Color Channels
    [M,N,C] = size(img_sample);
    si = M/2 - crop_half_size(1) + 1;
    sj = N/2 - crop_half_size(2) + 1;
    ei = si + crop_half_size(1)*2 - 1;
    ej = sj + crop_half_size(2)*2 - 1;
    img_sample = img_sample(si:ei, sj:ej,:);
    [M,N,C] = size(img_sample);

    %Gaussian Filter
    gfilt = fspecial('gaussian');
    filt_img{1} = imfilter(img_sample, gfilt, 'replicate');
    %Add Noise
    filt_img{2} = imnoise(img_sample);
    %JPEG Compression
    imwrite(img_sample,tempfile,'jpg');
    filt_img{3} = imread(tempfile);
    cnt = 0;
    for i=1:3
        iqm(cnt+1) = iqm_mae(img_sample, filt_img{i});
        iqm(cnt+2) = iqm_mse(img_sample, filt_img{i});
        iqm(cnt+3) = iqm_czekanowski(img_sample, filt_img{i});
        iqm(cnt+4) = iqm_crosscorr(img_sample, filt_img{i});
        iqm(cnt+5) = iqm_normcrosscorr(img_sample, filt_img{i});
        iqm(cnt+6) = iqm_mas(img_sample, filt_img{i});
        iqm(cnt+7) = iqm_spectralmagnitude(img_sample, filt_img{i});
        iqm(cnt+8) = iqm_spectralphase(img_sample, filt_img{i});
        iqm(cnt+9) = iqm_hvs(img_sample, filt_img{i});
        iqm(cnt+10) = iqm_laplacianmse(img_sample, filt_img{i});
        cnt = cnt + 10;
    end
    %SPIHT
    [m1,n1,c1]=size(img_sample);
    if(c1==3)
    gray_img = rgb2gray(img_sample);
    else
        gray_img = img_sample;
    end
    s_img = SPIHT(img_sample);
    iqm(cnt+1) = iqm_mae(gray_img, s_img);
    iqm(cnt+2) = iqm_mse(gray_img, s_img);
    iqm(cnt+3) = iqm_czekanowski(gray_img, s_img);
    iqm(cnt+4) = iqm_crosscorr(gray_img, s_img);
    iqm(cnt+5) = iqm_normcrosscorr(gray_img, s_img);
    iqm(cnt+6) = iqm_mas(gray_img, s_img);
    iqm(cnt+7) = iqm_spectralmagnitude(gray_img, s_img);
    iqm(cnt+8) = iqm_spectralphase(gray_img, s_img);
    iqm(cnt+9) = iqm_hvs(gray_img, s_img);
    iqm(cnt+10) = iqm_laplacianmse(gray_img, s_img);
    xlswrite(strcat(dirname,strcat(outputfile,'.xlsx')), iqm, 1, strcat('A',int2str(im)));
end
delete(strcat(tempdir,'\*'));
rmdir(tempdir);
