function [ wienerfil ] = Wiener( img, localvar, d0 )
%WIENER Summary of this function goes here
%   Detailed explanation goes here
    temp = localvar/(localvar * power(d0,2)) ;
    wienerfil = img * temp;

end
