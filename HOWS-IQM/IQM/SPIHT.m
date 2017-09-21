function [img_spiht] = SPIHT(img_sample)
% input:    Orig_I : the original image.
%           rate : bits per pixel
% output:   img_spiht 
%

crop_half_size = [256 256];
%M,N,C <= No. of Rows, Cols, Color Channels
[M,N,C] = size(img_sample); 
si = M/2 - crop_half_size(1) + 1;
sj = N/2 - crop_half_size(2) + 1;
ei = si + crop_half_size(1)*2 - 1;
ej = sj + crop_half_size(2)*2 - 1;
img_sample = img_sample(si:ei, sj:ej, :);	

[m1,n1,c1]=size(img_sample);
    if(c1==3)    
    img_sample = rgb2gray(img_sample);
    else
        img_sample = img_sample;
    end
% img_sample = rgb2gray(img_sample);
   
Orig_I = double(img_sample);
rate = 1;
OrigSize = size(Orig_I, 1);
max_bits = floor(rate * OrigSize^2);
OutSize = OrigSize;
image_spiht = zeros(size(Orig_I));
[nRow, nColumn] = size(Orig_I);

%fprintf('-----------   Wavelet Decomposition   ----------------\n');
n = size(Orig_I,1);
n_log = log2(n); 
level = n_log;
% wavelet decomposition level can be defined by users manually.
type = 'bior4.4';
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(type);
[I_W, S] = func_DWT(Orig_I, level, Lo_D, Hi_D);

%fprintf('-----------   Encoding   ----------------\n');
img_enc = func_SPIHT_Enc(I_W, max_bits, nRow*nColumn, level);   

%fprintf('-----------   Decoding   ----------------\n');
img_dec = func_SPIHT_Dec(img_enc);

%fprintf('-----------   Wavelet Reconstruction   ----------------\n');
img_spiht = func_InvDWT(img_dec, S, Lo_R, Hi_R, level);	
