clear
clc
close all

r = [1;2;3;nan;nan;6;nan;8];
Ye = repmat(r,1,5);
rNan = find(isnan(r));
rNoNan = find(~isnan(r));
r0 = r(rNoNan);

Obs   = ~isnan(Ye); % 1 is non-nan value, 0 is nan
hidden = find(~Obs); % hidden consists the indices of missing values

for i=1:5;  
    M(i) = mean(Ye(~hidden(:,i),i)); 
end;
r