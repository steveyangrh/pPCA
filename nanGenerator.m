% this function is used for generating random nans in a matrix
% mycell is input cell which contains matrices
% ratio is the percentage of nans in the matrices
% newcell is the output
% June 8, 2016
% Ronghao Yang

function R0New=nanGenerator(R0,ratio)

	safe = 0;
	if(~safe)
		R0New = R0;
	    numNaN = ceil(numel(R0)*(ratio/100));
	    R0New(randperm(numel(R0),numNaN)) = NaN;
	    safe = checkNan(R0New);
	end

end
