function [ locvar ] = Localvar( img )
%LOCALVAR Summary of this function goes here
%   Detailed explanation goes here
    D = [3 5 7 9]
    d0=5;
    [m,n] = size(img);
    sum=0; 
    for i=1:m
        for j=1:n
            temp=power(img(i,j),2)-power(d0,2);
            sum=sum+temp; 
        end
    end
    var1=max(0,sum/power(D(1),2));
    var2=max(0,sum/power(D(2),2));
    var3=max(0,sum/power(D(3),2));
    var4=max(0,sum/power(D(4),2));
    locvar= min([var1,var2,var3,var4]);
    
end
