
% DEMSWISSROLLLLE4 Demonstrate LLE on the oil data.
%
%	Description:
%	% 	demSwissRollLle4.m SVN version 97
% 	last update 2008-10-05T23:06:01.000000Z

[Y, lbls] = lvmLoadData('swissRoll');

options = lleOptions(32, 2);
model = lleCreate(2, size(Y, 2), Y, options);
model = lleOptimise(model);

lvmScatterPlotColor(model, model.Y(:, 2));

if exist('printDiagram') & printDiagram
  lvmPrintPlot(model, model.Y(:, 2), 'SwissRoll', 4, true);
end
