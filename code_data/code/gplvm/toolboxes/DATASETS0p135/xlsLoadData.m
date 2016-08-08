function [data, names] = xlsLoadData(fileName, sheetName)

% XLSLOADDATA Wrapper function for xlsread to get files from the datasets directory.
%
%	Description:
%	[data, names] = xlsLoadData(fileName, sheetName)
%% 	xlsLoadData.m CVS version 1.1
% 	xlsLoadData.m SVN version 25
% 	last update 2007-03-27T17:00:52.865460Z

baseDir = datasetsDirectory;
[data, names] = xlsread([baseDir fileName], sheetName);
