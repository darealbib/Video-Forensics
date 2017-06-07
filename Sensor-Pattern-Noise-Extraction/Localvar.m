function [ min_var ] = Localvar( img )
%LOCALVAR Summary of this function goes here
%   Detailed explanation goes here
    D = [3 5 7 9];
    d0=5;
    [m,n] = size(img);
    sum=0; min_var=9999999999;
      for k=1:size(D)
        for i=1:D(k)
          for j=1:D(k)
              temp=power(img(i,j),2)-power(d0,2);
              sum=sum+temp;
            end
          end
          var=max(0,sum/power(D(k),2));
          min_var = min(min_var,var);
    end
    % var1=max(0,sum/power(D(1),2));
    % % var2=max(0,sum/power(D(2),2));
    % % var3=max(0,sum/power(D(3),2));
    % % var4=max(0,sum/power(D(4),2));


end
