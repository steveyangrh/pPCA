function safe = checkNan(R)
% determine if there are any columns that all the elements are nans
% safe = 1, no such columns
% safe = 0, there are such columns
    safeSum = sum(all(isnan(R),1));
    if safeSum == 0
        safe = 1;
    else
        safe = 0;
    end
    
end