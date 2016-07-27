function rmse = computeRMSE(M1,M2,indexToValidate)
%% Computes root mean squarred error between two matrices, ignores NaN in either
% Vadim Bulitko
% June 8, 2016
% Modified by Ronghao Yang on June 27, 2016

error(nargchk(2,inf,nargin))

i1 = ~isnan(M1);
i2 = ~isnan(M2);
if nargin<3
  i = i1 & i2;
else
  i = indexToValidate;
end

if (~any(i))
    % there is no overlap between the two matrices in
    rmse = NaN;
    return
end

diff = (M1(i) - M2(i)).^2;
rmse = sqrt(mean(diff(:)));

end
