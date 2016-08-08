function [model, lbls] = lvmLoadResult(modelType, dataSet, number)

% LVMLOADRESULT Load a previously saved result.
%
%	Description:
%
%	[MODEL, LBLS] = LVMLOADRESULT(DATASET, NUMBER) loads a previously
%	saved LVM result.
%	 Returns:
%	  MODEL - the saved model.
%	  LBLS - labels of the data set (for visualisation purposes).
%	 Arguments:
%	  DATASET - the name of the data set to load.
%	  NUMBER - the number of the LVM run to load.
%	
%
%	See also
%	LVMLOADDATA


%	Copyright (c) 2003, 2004, 2005, 2006, 2008 Neil D. Lawrence
% 	lvmLoadResult.m SVN version 315
% 	last update 2009-04-09T17:58:36.000000Z



[Y, lbls] = lvmLoadData(dataSet);

dataSet(1) = upper(dataSet(1));
if ~isempty(modelType)
    modelType(1) = upper(modelType(1));
end

load(['dem' dataSet modelType num2str(number)])
