function lvmPrintPlot(model, lbls, capName, experimentNo, colour)

% LVMPRINTPLOT Print latent space for learnt model.
%
%	Description:
%
%	LVMPRINTPLOT(MODEL, LBLS, CAPNAME, EXPERIMENTNO) prints a latent
%	space repsresentation for an LVM model.
%	 Arguments:
%	  MODEL - the model to use for plotting the latent space.
%	  LBLS - any lables that are available for plotting.
%	  CAPNAME - the name of the saved plots.
%	  EXPERIMENTNO - the experiment number to assign to the files.
%	
%
%	See also
%	LVMSCATTERPLOT


%	Copyright (c) 2006 Neil D. Lawrence
% 	lvmPrintPlot.m SVN version 118
% 	last update 2008-10-16T18:00:15.000000Z

if nargin < 5
  colour = 0;
end
if colour
  lvmScatterPlotColor(model, lbls);
else
  lvmScatterPlot(model, lbls);
end
modelType = model.type;
modelType(1) = upper(modelType(1));
fileName = ['dem' capName modelType num2str(experimentNo)];
directory = ['../tex/diagrams'];
printPlot(fileName, directory, '../html');

figure
clf
ax = axes('position', [0.05 0.05 0.9 0.9]);
hold on
if ~isempty(lbls) && ~strcmp(lbls, 'connect')
  lvmTwoDPlot(model.X, lbls, getSymbols(size(lbls, 2)));
else
  lvmTwoDPlot(model.X, lbls);
end
xLim = [min(model.X(:, 1)) max(model.X(:, 1))]*1.1;
yLim = [min(model.X(:, 2)) max(model.X(:, 2))]*1.1;
set(ax, 'xLim', xLim);
set(ax, 'yLim', yLim);

set(ax, 'fontname', 'arial');
set(ax, 'fontsize', 20);
printPlot([fileName 'NoGray'], directory, '../html');
%print('-depsc', ['../tex/diagrams/' fileName 'NoGray'])
%print('-deps', ['../tex/diagrams/' fileName 'NoGrayNoColour'])
